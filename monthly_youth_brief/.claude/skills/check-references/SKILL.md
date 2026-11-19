---
name: check-references
description: Check that every reference (article, report, DOI, link) in a draft, a claim or docs/sources.csv exists and says what the text says. Use when the user asks to check references, citations, DOIs or links.
---

# Check references

## Steps

1. For each DOI, open `https://api.crossref.org/works/<DOI>`.
   Compare the title, the authors and the year with the reference.
   A DOI that exists but belongs to another paper is a reference problem.
2. For a reference without a DOI, search
   `https://api.openalex.org/works?search=<title>&per-page=3`.
   If nothing matches, the reference may be made up: reference problem.
3. For each link, open it and find the sentence or the number that the text
   uses. Copy the exact words into `where_in_source`.
4. Write the results as rows of `outputs/claim_checks.csv` (same columns as
   the check-claims skill). Use problem = `reference problem` when something
   does not match, and say what you found instead.
