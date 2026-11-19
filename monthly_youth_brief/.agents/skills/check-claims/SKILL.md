---
name: check-claims
description: Check factual claims about youth unemployment against the data and the sources (fact-checking). Use when the user asks to check claims, a news article, a list of claims, or a draft memo or brief.
---

# Check claims

A claim is checked only when five things match the source:
the number, the unit, the place, the period and the group.
(Habit 2: read one number aloud.)

## Steps

1. Split the text into single claims: one number or one cause per claim.
2. For each claim, find the value in `outputs/` (files made by scripts) or in
   a source listed in `docs/sources.csv`. Open the file and find the row.
3. Write one row per claim to `outputs/claim_checks.csv`, with exactly these
   columns:
   `id,claim,verdict,value_found,unit,place,period,group,source_key,where_in_source,problem`
   - verdict: `supported`, `not supported` or `cannot check`
   - problem: `none`, `wrong number`, `rate vs share`, `wrong period`,
     `wrong group`, `cause not in source`, `reference problem` or `other`
   - where_in_source: the file and row, or the exact words on the page.
4. Run: `python3 scripts/check_columns.py outputs/claim_checks.csv`
5. If you checked `evals/claims_test.csv`, keep its ids (E1, E2, ...) and run:
   `python3 scripts/score_evals.py`

## Common problems

- Rate vs share: the unemployment rate is a share of the labour force, not
  of all young people. "One in four young people is unemployed" is usually
  wrong. The share of all young people is the ratio (source EU3).
- Wrong period: a value from an earlier month is presented as the latest.
- Cause not in source: the number is right, but the "because ..." is not in
  any source.
- Never mark a claim "supported" because it sounds right. If you cannot find
  the row, the verdict is "cannot check".
