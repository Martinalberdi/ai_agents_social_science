#!/usr/bin/env python3
"""Automatic check (a hook): which numbers in a draft did no script make?

Runs after every Write or Edit (see .claude/settings.json). It only looks at
Markdown files in drafts/. It lists every number that has a decimal point or
a unit (%, pp, percent, percentage points) and is not in the table that the
drafts may use: outputs/latest_rates.csv, made by scripts/02_make_tables.R.
Years, dates, links and DOIs are ignored.

It is a simple lock: it checks that a number exists in that table, not that
it is the right number for that sentence. That needs judgement: the checker
helper agent does it.

If it finds such numbers, it tells the agent (decision "block" = feedback the
agent must deal with) and writes outputs/number_check.md. The agent cannot
skip this check: the harness runs it, not the LLM.

Standard library only. Can also be run by hand:
    python3 scripts/check_numbers.py drafts/brief.md
"""
import csv, datetime, json, os, re, sys

NUM = re.compile(
    r"(?<![\w.\-/])(-?\d+(?:\.\d+)?)\s*(%|pp\b|percent\b|per cent\b|percentage points?\b)?",
    re.IGNORECASE)


def one_decimal(x):
    try:
        return f"{abs(float(x)):.1f}"
    except ValueError:
        return None


ALLOWED_FILES = ["outputs/latest_rates.csv"]


def allowed_numbers(project):
    allowed = set()
    for path in [os.path.join(project, f) for f in ALLOWED_FILES]:
        if not os.path.exists(path):
            continue
        with open(path, newline="", encoding="utf-8") as f:
            for row in csv.reader(f):
                for cell in row:
                    v = one_decimal(cell.strip())
                    if v is not None:
                        allowed.add(v)
    return allowed


def numbers_to_check(text):
    text = re.sub(r"https?://\S+", " ", text)              # links
    text = re.sub(r"\b10\.\d{4,9}/\S+", " ", text)          # DOIs
    text = re.sub(r"\b\d{4}-\d{2}(-\d{2})?\b", " ", text)   # dates 2026-09
    text = re.sub(r"\[[A-Z]{2}\d*[^\]]*\]", " ", text)      # source keys [EU1]
    found = []
    for lineno, line in enumerate(text.splitlines(), start=1):
        for m in NUM.finditer(line):
            number, unit = m.group(1), m.group(2)
            is_year = re.fullmatch(r"(19|20)\d\d", number) is not None
            if is_year and not unit:
                continue
            if "." in number or unit:
                found.append((lineno, number + (unit or "")))
    return found


def main():
    if len(sys.argv) > 1:                       # run by hand
        project, draft = os.getcwd(), sys.argv[1]
    else:                                       # run as a hook
        data = json.load(sys.stdin)
        project = os.environ.get("CLAUDE_PROJECT_DIR", data.get("cwd", os.getcwd()))
        draft = (data.get("tool_input") or {}).get("file_path", "")
    draft_abs = draft if os.path.isabs(draft) else os.path.join(project, draft)
    rel = os.path.relpath(draft_abs, project)
    if not (rel.startswith("drafts" + os.sep) and rel.endswith(".md")):
        return 0
    if not os.path.exists(draft_abs):
        return 0

    with open(draft_abs, encoding="utf-8") as f:
        found = numbers_to_check(f.read())
    allowed = allowed_numbers(project)
    missing = [(ln, n) for ln, n in found
               if one_decimal(re.sub(r"[^\d.\-]", "", n)) not in allowed]

    stamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    report = os.path.join(project, "outputs", "number_check.md")
    with open(report, "w", encoding="utf-8") as f:
        f.write(f"# Automatic number check\n\n{stamp}, file `{rel}`\n\n")
        f.write(f"Numbers checked: {len(found)}. Not in {', '.join(ALLOWED_FILES)}: {len(missing)}.\n\n")
        for ln, n in missing:
            f.write(f"- line {ln}: {n}\n")

    if missing:
        listing = "; ".join(f"{n} (line {ln})" for ln, n in missing)
        msg = (f"Automatic number check: {len(missing)} number(s) in {rel} are not in "
               f"{', '.join(ALLOWED_FILES)}, the table made by scripts/02_make_tables.R: {listing}. "
               f"Replace each one with a number from that table, or delete the sentence. "
               f"Report: outputs/number_check.md")
        if len(sys.argv) > 1:
            print(msg)
            return 1
        print(json.dumps({"decision": "block", "reason": msg}))
    elif len(sys.argv) > 1:
        print(f"OK: all {len(found)} numbers in {rel} are in {', '.join(ALLOWED_FILES)}.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
