library(fitzRoy)
library(dplyr)
install.packages("devtools")

devtools::install_github("jimmyday12/fitzRoy") 
# Get current year (you can also manually set it)
current_year <- as.numeric(format(Sys.Date(), "%Y"))

# Fetch all results for this year
latest_results <- fetch_results_footywire(season = current_year)

# Find the latest round number
latest_round <- max(latest_results$Round)

# Filter only newest round
newest_round_data <- latest_results %>%
  filter(Round == latest_round)

# View results
print(newest_round_data)


