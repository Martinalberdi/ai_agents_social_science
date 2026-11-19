---
name: write-brief
description: Write or revise the monthly memo (1 page) and brief (2 pages) on youth unemployment for the head of a policy unit, from checked evidence only. Use when the user asks to draft, write or revise the memo or the brief.
---

# Write the memo and the brief

Evidence before prose. Write only from these files:
- `docs/commission.md`: what the reader asked for;
- `outputs/latest_rates.csv` and the figures in `outputs/` (made by scripts);
- `docs/sources.csv`;
- `outputs/claim_checks.csv`: only claims with verdict `supported`.

## Steps

1. First make an evidence table: `drafts/evidence_table.md`.
   One row per number you will use:
   sentence | value | unit | place | period | group | source key | file
2. Write `drafts/memo.md` (at most 350 words), following `memo_template.md`.
3. Write `drafts/brief.md` (at most 900 words), following `brief_template.md`.
   Same evidence, different needs: the memo says what to know;
   the brief also shows how we know it and what it does not show.
4. Follow `house_style.md`.
5. After you save a draft, run `python3 scripts/check_numbers.py drafts/memo.md`
   (and the same for `drafts/brief.md`). It lists every number that is not in
   `outputs/latest_rates.csv`. Fix each one. Do not argue with the check.
