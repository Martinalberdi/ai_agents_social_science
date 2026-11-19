---
name: monthly-brief
description: Run the whole monthly workflow (request, data, sources, fact-check, memo and brief, checks) and stop for human review. Only when the user types /monthly-brief.
---

# Monthly brief: the whole workflow

You are the lead agent. You divide the work among the helper agents and put
their results together. You do not write the memo or the brief yourself.

## Steps

0. **The request.** Read `docs/commission.md`. If it has no request yet, use
   `docs/commission_backup.md` (or my meeting notes, if I connected them).
   Write `docs/commission.md`: reader, deadline, countries, questions, worries.
   Show it to me in one paragraph.
1. **Data.** Run `Rscript scripts/01_download_eurostat.R`, then
   `Rscript scripts/02_make_tables.R`. Report the latest month and any
   country with a missing month. If R is not installed, do not install it:
   use the tables already in `outputs/` and say so.
2. **Sources, in parallel.** Start one source-finder helper agent per country
   (ES, EL, IT, SE, FR, PL, DE, NL, CZ, RO), all at the same time. If you
   cannot start helper agents, do the countries yourself with the
   find-sources skill, one after another. Each one
   writes at most 3 rows to `docs/sources_<CODE>.csv` and a short note to
   `docs/country_notes/<CODE>.md`. When all have finished, merge the rows into
   `docs/sources.csv` and run `python3 scripts/check_columns.py docs/sources.csv`.
3. **Fact-check.** Give the checker helper agent `evals/claims_test.csv` and,
   if it has content, `docs/claims_to_check.md`. It writes
   `outputs/claim_checks.csv`. Then run `python3 scripts/score_evals.py`.
4. **Write.** Ask the writer helper agent to write `drafts/memo.md` and
   `drafts/brief.md` with the write-brief skill. Then run
   `python3 scripts/check_numbers.py drafts/memo.md` and the same for
   `drafts/brief.md`. Send every number it lists back to the writer.
5. **Check.** Ask the checker helper agent to check both drafts. It writes
   `outputs/draft_check.csv` and `outputs/checks.md`.
6. **Fix loop.** If `outputs/checks.md` has red items, send them to the writer
   once, then check again. At most 2 rounds. If items are still red after
   2 rounds, stop and list them (habit 5: fails twice, smaller step).
7. **STOP for human review.** Write `WAITING FOR HUMAN REVIEW` at the top of
   `outputs/checks.md`. Give me five lines: what was done; what is green,
   amber and red; what I must decide. Do not share, send or publish anything.
8. **After I approve:** draft `logs/ai_use_statement.md` from this
   conversation (what the agents did, which tools and sources they used,
   what I checked and changed). I edit and sign it.
