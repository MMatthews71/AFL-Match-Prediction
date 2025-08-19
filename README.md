# AFL Match Prediction

## Overview
This project develops a machine learning pipeline to predict Australian Football League (AFL) match outcomes using historical data from 2015 to 2025. By leveraging player and match statistics scraped from Footywire via the fitzRoy package, the project employs advanced feature engineering and ensemble modeling to forecast match winners with high accuracy. The goal is to create an interpretable and dynamic model for predicting future rounds, enabling applications in fan engagement and strategic analysis.

# Dataset
The dataset includes transaction-level data from Footywire, covering player statistics (e.g., goals, disposals, contested possessions) and match results (e.g., scores, venues, dates) across 10+ seasons. This rich dataset, comprising over 2,200 matches, provides detailed insights into team and player performance trends.

# Methodology

Data Cleaning and Preprocessing: Handling missing values, normalizing venue names, and converting rounds to integers.

Feature Engineering: Creating metrics like team Elo ratings, venue win rates, recent form (last 5 games), and rest days.

Modeling: Implementing a Voting Ensemble with tuned Logistic Regression, Random Forest, Gradient Boosting, and SVM, balanced using SMOTE and optimized via RandomSearchCV.

Evaluation: Assessing model performance with accuracy, F1-score, ROC-AUC, and confusion matrices, including threshold optimization.

Dynamic Forecasting: Automating data preprocessing and model retraining for new rounds, with predictions for matches like Round 24, 2025.

# Results
The model achieved 7/9 correct predictions for Round 21, 2025, demonstrating strong performance, particularly in decisive matchups. Key findings include:

High-Confidence Predictions: Matches with clear favorites (e.g., Gold Coast vs. Essendon, 85.36% home win probability) were accurately predicted.

Close Match Challenges: Misclassifications occurred in tightly contested games, indicating areas for refinement in handling balanced matchups.

Actionable Insights: Features like Elo ratings and venue win rates were critical drivers, as revealed by SHAP analysis, offering strategic insights for teams and analysts.

These results support targeted applications, such as informing betting strategies or enhancing fan experiences with predictive tools.

# Technologies Used

Python (pandas, numpy, scikit-learn, statsmodels, matplotlib, seaborn, imblearn)

R (fitzRoy for data scraping)

Jupyter Notebook

# How to Use

Clone the repository:git clone https://github.com/yourusername/afl-match-prediction.git
cd afl-match-prediction


Install required libraries:pip install -r requirements.txt

Or manually:pip install pandas numpy scikit-learn shap statsmodels matplotlib seaborn imblearn fitzRoy


Place raw data files (footywire_player_stats_*.csv, footywire_match_results_*.csv) in the data/ directory or scrape new data using scripts/FitzRoy.R.

Run the Jupyter notebook (notebooks/01-afl-match-prediction.ipynb) to execute the pipeline.

Update the round24_games_2025 fixture list for new predictions and explore results in results/.

# Example Output

For Round 24, 2025, the model predicts:

Essendon vs. Carlton: Carlton (Away), 73.95% probability.
Collingwood vs. Melbourne: Collingwood (Home), 71.89% probability.
Brisbane vs. Hawthorn: Brisbane (Home), 56.96% probability.

Full results are available in results/round24_predictions.csv.

# Contact
For questions or collaboration, please reach out via matthewsmax44@gmail.com or open an issue in this repository.

This project showcases the power of machine learning in sports analytics, delivering a robust and interpretable solution for AFL match prediction with potential for real-world impact.
