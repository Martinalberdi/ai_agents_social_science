#!/usr/bin/env python3
"""Evals: score the checker on claims with known answers.

Compares outputs/claim_checks.csv (what the checker said) with
evals/answer_key.csv (the right answers, written by a person before the run).
Writes outputs/eval_score.md and prints the score. Run it again after every
change to a skill or a helper agent: did the score go up or down?
Standard library only.
"""
import csv, datetime, os, sys


def read(path):
    with open(path, newline="", encoding="utf-8") as f:
        return {row["id"]: row for row in csv.DictReader(f)}


def main():
    key = read(os.path.join("evals", "answer_key.csv"))
    got_path = os.path.join("outputs", "claim_checks.csv")
    if not os.path.exists(got_path):
        print("No outputs/claim_checks.csv yet. Run the checker first.")
        return 1
    got = read(got_path)
    lines, right, right_problem = [], 0, 0
    for cid, ans in key.items():
        g = got.get(cid, {})
        v_ok = g.get("verdict", "(missing)") == ans["verdict"]
        p_ok = g.get("problem", "(missing)") == ans["problem"]
        right += v_ok
        right_problem += v_ok and p_ok
        lines.append(f"| {cid} | {ans['verdict']} | {g.get('verdict', '(missing)')} | "
                     f"{ans['problem']} | {g.get('problem', '(missing)')} | "
                     f"{'yes' if v_ok else 'NO'} |")
    n = len(key)
    stamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M")
    with open(os.path.join("outputs", "eval_score.md"), "w", encoding="utf-8") as f:
        f.write(f"# Eval score, {stamp}\n\n")
        f.write(f"**Right verdict: {right} of {n}.** Right verdict and right problem: "
                f"{right_problem} of {n}.\n\n")
        f.write("| id | right verdict | checker said | right problem | checker said | ok |\n")
        f.write("|---|---|---|---|---|---|\n")
        f.write("\n".join(lines) + "\n")
    print(f"Right verdict: {right} of {n}. Right verdict and problem: {right_problem} of {n}.")
    print("Details: outputs/eval_score.md")
    return 0


if __name__ == "__main__":
    sys.exit(main())
