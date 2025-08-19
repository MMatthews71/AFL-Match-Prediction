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
fitzRoy_version <- as.character(packageVersion("fitzRoy"))
cat("fitzRoy version:", fitzRoy_version, "\n")

# Define output directory with absolute path for reliability
output_directory <- file.path(normalizePath(".."), "data")
if (!dir.exists(output_directory)) {
  cat("Creating directory:", output_directory, "\n")
  dir.create(output_directory, recursive = TRUE, showWarnings = TRUE)
  if (!dir.exists(output_directory)) stop("Failed to create directory:", output_directory)
}

# Seasons to scrape
seasons <- 2025

# ---------------- PLAYER STATS ----------------
for (season in seasons) {
  cat("Scraping player stats for season:", season, "\n")
  season_stats <- tryCatch({
    fetch_player_stats_footywire(season = season)
  }, error = function(e) {
    cat("Error fetching player stats for season", season, ":", e$message, "\n")
    return(NULL)
  })
  
  if (!is.null(season_stats) && nrow(season_stats) > 0) {
    cat("Preview of player stats for", season, ":\n")
    print(head(season_stats))
    cat("Dimensions of player stats:", dim(season_stats), "\n")
    
    output_file <- file.path(output_directory, paste0("new_footywire_player_stats_", season, ".csv"))
    tryCatch({
      write.csv(season_stats, output_file, row.names = FALSE)
      cat("Player stats CSV saved to:", output_file, "\n")
      if (file.exists(output_file)) cat("File verification successful.\n") else cat("File not found after saving.\n")
    }, error = function(e) {
      cat("Error saving player stats to", output_file, ":", e$message, "\n")
    })
  } else {
    cat("No player stats data retrieved for season", season, "\n")
  }
}

# ---------------- MATCH RESULTS ----------------
for (season in seasons) {
  cat("Scraping match results for season:", season, "\n")
  match_results <- tryCatch({
    fetch_results_footywire(season = season)
  }, error = function(e) {
    cat("Error fetching match results for season", season, ":", e$message, "\n")
    return(NULL)
  })
  
  if (!is.null(match_results) && nrow(match_results) > 0) {
    cat("Preview of match results for", season, ":\n")
    print(head(match_results))
    cat("Dimensions of match results:", dim(match_results), "\n")
    
    output_file <- file.path(output_directory, paste0("new_footywire_match_results_", season, ".csv"))
    tryCatch({
      write.csv(match_results, output_file, row.names = FALSE)
      cat("Match results CSV saved to:", output_file, "\n")
      if (file.exists(output_file)) cat("File verification successful.\n") else cat("File not found after saving.\n")
    }, error = function(e) {
      cat("Error saving match results to", output_file, ":", e$message, "\n")
    })
  } else {
    cat("No match results data retrieved for season", season, "\n")
  }
}
