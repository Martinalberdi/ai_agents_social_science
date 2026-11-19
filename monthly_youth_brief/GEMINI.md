# Monthly youth unemployment brief: instruction file (project)

<!-- Antigravity reads this file (GEMINI.md). Claude Code reads CLAUDE.md, with the same rules. -->

The agent reads this file at the start of every session. It holds short rules
and decisions only. How to do each task is in the skills (`.agents/skills/`).

## The job

- Every month: a 1-page memo and a 2-page brief for the head of a policy unit.
- Topic: youth unemployment in 10 countries and the EU-27.
- Countries: Spain (ES), Greece (EL), Italy (IT), Sweden (SE), France (FR),
  Poland (PL), Germany (DE), Netherlands (NL), Czechia (CZ), Romania (RO),
  and the EU-27 average (EU27_2020).
- Main measure: Eurostat table `une_rt_m`, people under 25, seasonally
  adjusted, percentage of the labour force. The latest month, and the change
  from the same month one year earlier.

## Decisions (each one written here once)

- "Youth unemployment rate" means: unemployed people under 25, as a share of
  people under 25 in the labour force (people who work or look for work).
  It is NOT the share of all young people. For that, use the youth
  unemployment ratio (Eurostat `yth_empl_140`, ages 15-24, yearly).
- A country has no value for the latest month: say so, and give the latest
  month available. Never fill a gap.
- Rounding: one decimal, as Eurostat publishes it.
- A value with a flag (e.g. `d` = definition differs): report the flag.

## Rules

- `data/raw/` is never edited. New downloads have the date in the file name.
- Every number in a draft comes from `outputs/latest_rates.csv`, made by
  `scripts/02_make_tables.R`. Every sentence with a number ends with a source
  key, e.g. [EU1].
- Every source is a row in `docs/sources.csv` before it is used.
- No causes ("because", "due to", "driven by") unless a source in
  `docs/sources.csv` says so, and the sentence cites it.
- Web access is only for finding and checking sources. Never send project
  files anywhere.
- Before anything is shared: STOP and wait for the human review.

## Where things are

- Skills (project): find-sources, check-claims, check-references,
  write-brief, monthly-brief (`.agents/skills/`). Call one by its name, e.g. `/monthly-brief`.
- Helper agents (task): source-finder, writer, checker (`.agents/agents/`).
  They work in the Antigravity App and CLI. In VS Code, do their steps yourself,
  one at a time, in a new conversation for each check.
- Automatic checks: after you save a draft, run
  `python3 scripts/check_numbers.py drafts/memo.md` (and the same for
  `drafts/brief.md`). Fix every number it lists.
- Never read `evals/answer_key.csv`. Only `scripts/score_evals.py` reads it.
