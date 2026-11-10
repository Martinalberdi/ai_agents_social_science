# =============================================================================
# 01_download_eurostat.R
# Download the Eurostat table ilc_lvps08 (young adults living with their
# parents) and save a dated copy in data/raw/.
#
# Run from the project folder (open youth_at_home_project.Rproj, or set the
# working directory to youth_at_home_project/). Uses base R only.
# =============================================================================

# Official Eurostat API (free, no key needed)
url <- paste0(
  "https://ec.europa.eu/eurostat/api/dissemination/sdmx/2.1/data/",
  "ilc_lvps08?format=SDMX-CSV&compressed=false"
)

# Dated file name: data can be revised after you download them
out_file <- file.path(
  "data", "raw",
  paste0("eurostat_ilc_lvps08_", format(Sys.Date(), "%Y-%m-%d"), ".csv")
)

if (file.exists(out_file)) {
  stop("File already exists: ", out_file,
       ". Raw data are never overwritten. Delete it by hand if you really want a new copy.")
}

dir.create(dirname(out_file), recursive = TRUE, showWarnings = FALSE)
download.file(url, destfile = out_file, mode = "wb", quiet = FALSE)

# Quick checks: the file is a table with the columns we expect
raw <- read.csv(out_file, check.names = FALSE)
expected <- c("age", "sex", "unit", "geo", "TIME_PERIOD", "OBS_VALUE", "OBS_FLAG")
stopifnot(all(expected %in% names(raw)))

cat("\nSaved:", out_file, "\n")
cat("Rows:", nrow(raw), "\n")
cat("Years:", min(raw$TIME_PERIOD), "to", max(raw$TIME_PERIOD), "\n")
cat("Countries and groups:", length(unique(raw$geo)), "\n")
