# Monthly youth unemployment brief (Session 4 project)

One workflow that finds sources, checks facts and writes a checked memo and brief
for the head of a policy unit. Youth unemployment (under 25) in 10 countries
and the EU-27, from Eurostat.

The folder works in two tools. The rules, the skills and the scripts are the same.

| | Antigravity | Claude Code (used in class) |
|---|---|---|
| Instruction file | `GEMINI.md` | `CLAUDE.md` |
| Skills | `.agents/skills/` | `.claude/skills/` |
| Helper agents | `.agents/agents/` (Antigravity app and command line; not in VS Code) | `.claude/agents/` |
| Locks | Antigravity settings ➜ permissions | `.claude/settings.json` |
| Automatic checks | Run `scripts/check_numbers.py` yourself after each draft | Hooks in `.claude/settings.json` |

## How to run

**Antigravity in VS Code:** follow `instructions/antigravity_map.pdf` in the course
folder. You run the steps one at a time, with a new conversation for each check.

**Antigravity app, or Claude Code:** open this folder and type `/monthly-brief`.
The workflow stops before anything is shared, and waits for your review.

## What is where

| Folder or file | What it is | Place |
|---|---|---|
| `GEMINI.md`, `CLAUDE.md` | Instruction file: rules and decisions, read every session | project |
| `.agents/skills/`, `.claude/skills/` | Skills: how to do one kind of task, read when needed | project |
| `.agents/agents/`, `.claude/agents/` | Helper agents: one job each, with their own skills and model | task |
| `.claude/settings.json` | Locks: allow / deny rules and automatic checks (hooks), for Claude Code | project |
| `scripts/01_download_eurostat.R` | Downloads 3 Eurostat tables through the API | |
| `scripts/02_make_tables.R` | Makes every number and figure the drafts may use | |
| `scripts/check_numbers.py` | Lists numbers in a draft that no script made | |
| `scripts/trace.py` | Claude Code only: writes every step to `logs/trace.md` | |
| `scripts/check_columns.py` | Checks that a table has the agreed columns | |
| `scripts/score_evals.py` | Scores the checker on claims with known answers | |
| `evals/` | Test claims, and the answer key (the agents may not read it) | |
| `docs/` | The request, the sources, notes per country | |
| `drafts/` | Evidence table, memo, brief | |
| `outputs/` | Tables, figures, check reports | |
| `logs/` | Trace and AI-use statement | |

## Requirements

Python 3 (standard library only). R (packages dplyr and ggplot2) is optional:
the tables and figures in `outputs/` were made on 17 November 2026, so you can
skip the data step. The Eurostat API is free and needs no key.
