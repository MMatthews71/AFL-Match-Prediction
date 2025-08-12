## Install and load required packages
if (!require("fitzRoy")) install.packages("fitzRoy", dependencies = TRUE)
if (!require("dplyr")) install.packages("dplyr", dependencies = TRUE)
if (!require("rvest")) install.packages("rvest", dependencies = TRUE)
if (!require("purrr")) install.packages("purrr", dependencies = TRUE)

library(fitzRoy)
library(dplyr)
library(rvest)
library(purrr)

# Check fitzRoy version to confirm compatibility
packageVersion("fitzRoy")

# Define output directory
output_directory <- "../data"
if (!dir.exists(output_directory)) {
  dir.create(output_directory, recursive = TRUE)
}

# Seasons to scrape
seasons <- 2015

# ---------------- PLAYER STATS ----------------
for (season in seasons) {
  cat("Scraping player stats for season:", season, "\n")
  season_stats <- fetch_player_stats_footywire(season = season)
  cat("Preview of player stats for", season, ":\n")
  print(head(season_stats))
  
  output_file <- file.path(output_directory, paste0("footywire_player_stats_", season, ".csv"))
  write.csv(season_stats, output_file, row.names = FALSE)
  cat("Player stats CSV saved to:", output_file, "\n")
}

# ---------------- MATCH RESULTS ----------------
for (season in seasons) {
  cat("Scraping match results for season:", season, "\n")
  match_results <- fetch_results_footywire(season = season)
  cat("Preview of match results for", season, ":\n")
  print(head(match_results))
  
  output_file <- file.path(output_directory, paste0("footywire_match_results_", season, ".csv"))
  write.csv(match_results, output_file, row.names = FALSE)
  cat("Match results CSV saved to:", output_file, "\n")
}
