# Young adults living with their parents

**Research question.** What share of 25–34-year-olds live with their parents in each EU country, and how has that share changed since 2010?

The results are descriptive: they show *how much* and *where*, not *why*.

## What is in this folder

| Path | What it is |
| --- | --- |
| `README.md` | This note: what the project is. |
| `GEMINI.md` | The instructions Antigravity reads at the start of every session. |
| `data/raw/` | The original Eurostat download. **Never edit, move, or delete anything here.** |
| `scripts/` | The recipes: files of instructions that turn raw data into results. |
| `outputs/` | Finished tables and charts. It starts empty. |

## Data

- Source: Eurostat, table `ilc_lvps08` (<https://doi.org/10.2908/ILC_LVPS08>).
- File: `data/raw/eurostat_ilc_lvps08_2026-11-06.csv`, downloaded on 6 November 2026.
- Size: 22,086 rows, covering 2003 to 2025.

The data are already included, so you do not need to download them or run `scripts/01_download_eurostat.R`. That script only records how the file was obtained.
