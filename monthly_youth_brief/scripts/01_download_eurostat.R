# =============================================================================
# 01_download_eurostat.R
# Download three Eurostat tables through the official API (free, no key) and
# save dated copies in data/raw/. Then record each table as a row in
# docs/sources.csv (provenance written by the script, not by hand).
#
#   une_rt_m      monthly unemployment rate, under 25, seasonally adjusted
#   une_rt_a      yearly unemployment rate, ages 15-24
#   yth_empl_140  yearly youth unemployment RATIO, ages 15-24
#                 (unemployed as a share of ALL young people)
#
# Run from the project folder:  Rscript scripts/01_download_eurostat.R
# Uses base R only.
# =============================================================================

geos <- c("EU27_2020", "ES", "EL", "IT", "SE", "FR", "PL", "DE", "NL", "CZ", "RO")
base <- "https://ec.europa.eu/eurostat/api/dissemination/sdmx/2.1/data/"
today <- format(Sys.Date(), "%Y-%m-%d")

tables <- list(
  list(key = "EU1", code = "une_rt_m",
       filter = paste0("M.SA.Y_LT25.PC_ACT.T.", paste(geos, collapse = "+")),
       start = "2024-01",
       title = "Unemployment by sex and age - monthly data (une_rt_m)",
       gives = "Monthly youth unemployment rate, under 25, seasonally adjusted, % of the labour force"),
  list(key = "EU2", code = "une_rt_a",
       filter = paste0("A.Y15-24.PC_ACT.T.", paste(geos, collapse = "+")),
       start = "2023",
       title = "Unemployment by sex and age - annual data (une_rt_a)",
       gives = "Yearly youth unemployment rate, ages 15-24, % of the labour force"),
  list(key = "EU3", code = "yth_empl_140",
       filter = paste0("A.T.Y15-24.PC.", paste(geos, collapse = "+")),
       start = "2023",
       title = "Youth unemployment ratio by NUTS 2 region (yth_empl_140)",
       gives = "Yearly youth unemployment ratio, ages 15-24, % of ALL young people")
)

dir.create(file.path("data", "raw"), recursive = TRUE, showWarnings = FALSE)
src_file <- file.path("docs", "sources.csv")

for (t in tables) {
  url <- paste0(base, t$code, "/", t$filter,
                "?format=SDMX-CSV&compressed=false&startPeriod=", t$start)
  out_file <- file.path("data", "raw", paste0("eurostat_", t$code, "_", today, ".csv"))

  if (file.exists(out_file)) {
    cat("Already downloaded today, not overwritten:", out_file, "\n")
  } else {
    download.file(url, destfile = out_file, mode = "wb", quiet = TRUE)
    cat("Saved:", out_file, "\n")
  }

  # Quick check: the file has the columns we expect
  raw <- read.csv(out_file, check.names = FALSE)
  stopifnot(all(c("geo", "TIME_PERIOD", "OBS_VALUE", "OBS_FLAG") %in% names(raw)))
  cat("  rows:", nrow(raw), " periods:", min(raw$TIME_PERIOD), "to",
      max(raw$TIME_PERIOD), " last update:", raw[["LAST UPDATE"]][1], "\n")

  # Provenance: one row per table in docs/sources.csv. The row is written
  # again at every download, so the dates match the newest raw file.
  src <- read.csv(src_file, check.names = FALSE, colClasses = "character")
  row <- data.frame(
    key = t$key, title = t$title, made_by = "Eurostat",
    original_or_copy = "original", url = url,
    date_published = raw[["LAST UPDATE"]][1], date_accessed = today,
    what_it_gives = t$gives,
    terms_of_use = "Eurostat reuse policy: free reuse with acknowledgement",
    check.names = FALSE)
  src <- rbind(src[src$key != t$key, , drop = FALSE], row)
  is_eu <- grepl("^EU", src$key)                  # Eurostat rows first, by key
  src <- rbind(src[is_eu, ][order(src$key[is_eu]), ], src[!is_eu, ])
  write.csv(src, src_file, row.names = FALSE)
  cat("  wrote", t$key, "in docs/sources.csv\n")
}
