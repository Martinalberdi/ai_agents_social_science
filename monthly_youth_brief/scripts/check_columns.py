#!/usr/bin/env python3
"""Structured output check: does a table have exactly the agreed columns and
only the agreed values? A program can check a fixed format; it cannot check
free text. Standard library only.

Usage: python3 scripts/check_columns.py <file.csv>
"""
import csv, os, sys

VERDICTS = {"supported", "not supported", "cannot check"}
PROBLEMS = {"none", "wrong number", "rate vs share", "wrong period", "wrong group",
            "cause not in source", "reference problem", "other"}

SCHEMAS = {
    "sources": ["key", "title", "made_by", "original_or_copy", "url", "date_published",
                "date_accessed", "what_it_gives", "terms_of_use"],
    "claim_checks": ["id", "claim", "verdict", "value_found", "unit", "place", "period",
                     "group", "source_key", "where_in_source", "problem"],
    "draft_check": ["id", "file", "sentence", "verdict", "value_found", "source_key",
                    "problem", "status"],
}


def schema_for(path):
    name = os.path.basename(path)
    if name.startswith("sources"):
        return "sources"
    for key in ("claim_checks", "draft_check"):
        if name.startswith(key):
            return key
    return None


def main():
    if len(sys.argv) != 2:
        print(__doc__)
        return 2
    path = sys.argv[1]
    kind = schema_for(path)
    if kind is None:
        print(f"No agreed format for {path}.")
        return 2
    with open(path, newline="", encoding="utf-8") as f:
        rows = list(csv.DictReader(f))
        f.seek(0)
        header = next(csv.reader(f), [])
    errors = []
    if header != SCHEMAS[kind]:
        errors.append(f"columns are {header}, expected {SCHEMAS[kind]}")
    seen = set()
    for i, row in enumerate(rows, start=2):
        if "verdict" in row and row["verdict"] not in VERDICTS:
            errors.append(f"line {i}: verdict '{row['verdict']}' is not one of {sorted(VERDICTS)}")
        if "problem" in row and row["problem"] not in PROBLEMS:
            errors.append(f"line {i}: problem '{row['problem']}' is not one of {sorted(PROBLEMS)}")
        if "status" in row and row["status"] not in {"green", "amber", "red"}:
            errors.append(f"line {i}: status '{row['status']}' is not green, amber or red")
        first = row.get(header[0], "") if header else ""
        if first in seen:
            errors.append(f"line {i}: {header[0]} '{first}' is used twice")
        seen.add(first)
    if errors:
        print(f"{path}: {len(errors)} problem(s)")
        for e in errors:
            print("  -", e)
        return 1
    print(f"OK: {path} has the agreed columns and values ({len(rows)} rows).")
    return 0


if __name__ == "__main__":
    sys.exit(main())
