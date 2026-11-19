# =============================================================================
# 02_make_tables.R
# Read the newest raw files in data/raw/ and make every number the drafts may
# use. If a number is not in a file this script writes, it does not go in the
# memo or the brief (the automatic check enforces this).
#
#   outputs/latest_rates.csv     one row per country: latest month, rate,
#                                change from one year earlier, gap to the EU,
#                                and the 2025 rate and ratio (ages 15-24)
#   outputs/rates_monthly.csv    all monthly values (for figures)
#   outputs/fig1_latest_rates.pdf / .png
#   outputs/fig2_rate_vs_ratio.pdf / .png
#
# Run from the project folder:  Rscript scripts/02_make_tables.R
# =============================================================================

suppressPackageStartupMessages({
  library(dplyr)
  library(ggplot2)
})

names_map <- c(EU27_2020 = "EU-27", ES = "Spain", EL = "Greece", IT = "Italy",
               SE = "Sweden", FR = "France", PL = "Poland", DE = "Germany",
               NL = "Netherlands", CZ = "Czechia", RO = "Romania")

newest <- function(code) {
  f <- sort(list.files("data/raw", pattern = paste0("^eurostat_", code, "_.*\\.csv$"),
                       full.names = TRUE), decreasing = TRUE)
  if (length(f) == 0) stop("No raw file for ", code, ". Run 01_download_eurostat.R first.")
  cat("Using", f[1], "\n")
  read.csv(f[1], check.names = FALSE, stringsAsFactors = FALSE)
}

# --- Monthly rate, under 25 ---------------------------------------------------
m <- newest("une_rt_m") |>
  transmute(geo, month = TIME_PERIOD, rate = OBS_VALUE,
            flag = ifelse(is.na(OBS_FLAG), "", OBS_FLAG)) |>
  filter(!is.na(rate))

latest_overall <- max(m$month)
eu <- m |> filter(geo == "EU27_2020") |> select(month, eu_rate = rate)

year_before <- function(month) {
  y <- as.integer(substr(month, 1, 4)) - 1
  paste0(y, substr(month, 5, 7))
}

latest <- m |>
  group_by(geo) |>
  filter(month == max(month)) |>
  ungroup() |>
  mutate(month_one_year_earlier = year_before(month)) |>
  left_join(m |> select(geo, month_one_year_earlier = month, rate_one_year_earlier = rate),
            by = c("geo", "month_one_year_earlier")) |>
  left_join(eu, by = "month") |>
  mutate(change_pp = round(rate - rate_one_year_earlier, 1),
         gap_to_eu_pp = round(rate - eu_rate, 1),
         latest_is_missing = month != latest_overall)

# --- Yearly rate and ratio, ages 15-24, 2025 -----------------------------------
a <- newest("une_rt_a") |>
  filter(TIME_PERIOD == 2025) |>
  transmute(geo, rate_2025_15_24 = OBS_VALUE,
            rate_2025_flag = ifelse(is.na(OBS_FLAG), "", OBS_FLAG))
r <- newest("yth_empl_140") |>
  filter(TIME_PERIOD == 2025) |>
  transmute(geo, ratio_2025_15_24 = OBS_VALUE,
            ratio_2025_flag = ifelse(is.na(OBS_FLAG), "", OBS_FLAG))

out <- latest |>
  left_join(a, by = "geo") |>
  left_join(r, by = "geo") |>
  mutate(country = names_map[geo]) |>
  select(geo, country, latest_month = month, rate, flag,
         month_one_year_earlier, rate_one_year_earlier, change_pp,
         eu_rate_same_month = eu_rate, gap_to_eu_pp, latest_is_missing,
         rate_2025_15_24, rate_2025_flag, ratio_2025_15_24, ratio_2025_flag) |>
  arrange(desc(rate))

dir.create("outputs", showWarnings = FALSE)
write.csv(out, "outputs/latest_rates.csv", row.names = FALSE, na = "")
write.csv(m |> mutate(country = names_map[geo]), "outputs/rates_monthly.csv",
          row.names = FALSE, na = "")

cat("\nLatest month in the data:", latest_overall, "\n")
miss <- out |> filter(latest_is_missing)
if (nrow(miss) > 0) {
  cat("No value for", latest_overall, "->", paste0(miss$country, " (latest ",
      miss$latest_month, ")", collapse = ", "), "\n")
}

# --- Figure 1: latest rate by country ------------------------------------------
f1 <- out |>
  mutate(label = ifelse(latest_is_missing,
                        paste0(country, " (", latest_month, ")"), country),
         label = reorder(label, rate),
         is_eu = geo == "EU27_2020")
p1 <- ggplot(f1, aes(x = rate, y = label)) +
  geom_segment(aes(x = 0, xend = rate, yend = label), colour = "grey80") +
  geom_point(aes(colour = is_eu), size = 3) +
  geom_text(aes(label = sprintf("%.1f", rate)), hjust = -0.4, size = 3.4) +
  scale_colour_manual(values = c(`FALSE` = "#008939", `TRUE` = "black"), guide = "none") +
  scale_x_continuous(limits = c(0, max(f1$rate) * 1.15), expand = c(0, 0)) +
  labs(x = "% of people under 25 in the labour force", y = NULL,
       title = paste0("Youth unemployment rate, ", latest_overall),
       caption = "Source: Eurostat une_rt_m, seasonally adjusted. Brackets: latest month available.") +
  theme_minimal(base_size = 11) +
  theme(panel.grid.major.y = element_blank(), plot.title.position = "plot")
ggsave("outputs/fig1_latest_rates.pdf", p1, width = 6.5, height = 4)
ggsave("outputs/fig1_latest_rates.png", p1, width = 6.5, height = 4, dpi = 200)

# --- Figure 2: rate versus ratio, 2025 --------------------------------------
f2 <- out |>
  filter(!is.na(rate_2025_15_24), !is.na(ratio_2025_15_24)) |>
  mutate(country = reorder(country, rate_2025_15_24))
p2 <- ggplot(f2, aes(y = country)) +
  geom_segment(aes(x = ratio_2025_15_24, xend = rate_2025_15_24, yend = country),
               colour = "grey75") +
  geom_point(aes(x = rate_2025_15_24, colour = "Rate: % of young people in the labour force"), size = 3) +
  geom_point(aes(x = ratio_2025_15_24, colour = "Ratio: % of ALL young people"), size = 3) +
  scale_colour_manual(values = c("#008939", "#E07B00"), name = NULL) +
  scale_x_continuous(limits = c(0, NA), expand = expansion(mult = c(0, 0.05))) +
  labs(x = "%", y = NULL, title = "Two numbers for youth unemployment, ages 15-24, 2025",
       caption = "Source: Eurostat une_rt_a (rate) and yth_empl_140 (ratio).") +
  theme_minimal(base_size = 11) +
  theme(legend.position = "top", panel.grid.major.y = element_blank(),
        plot.title.position = "plot")
ggsave("outputs/fig2_rate_vs_ratio.pdf", p2, width = 6.5, height = 4.2)
ggsave("outputs/fig2_rate_vs_ratio.png", p2, width = 6.5, height = 4.2, dpi = 200)

cat("Wrote outputs/latest_rates.csv, outputs/rates_monthly.csv and two figures.\n")
