# AFL Match Prediction

**Project Overview**

This project builds a machine learning pipeline to predict Australian Football League (AFL) match outcomes using historical data from 2015 to 2025. Utilizing player and match statistics scraped from Footywire via the fitzRoy package, the project employs advanced feature engineering and an ensemble modeling approach to forecast match winners with high accuracy. The goal is to deliver an interpretable and dynamic model capable of predicting future rounds.

**Key Features**

Data Source: Comprehensive dataset spanning 10+ seasons of AFL player statistics (e.g., goals, disposals, contested possessions) and match results (e.g., scores, venues), scraped using fitzRoy.
Feature Engineering: Custom features including team Elo ratings, venue-specific win rates, recent form (last 5 games), and rest days to capture team and match dynamics.
Modeling: A Voting Ensemble combining tuned Logistic Regression, Random Forest, Gradient Boosting, and SVM models, balanced with SMOTE and optimized via GridSearchCV. Achieved 7/9 correct predictions for Round 21, 2025.
Dynamic Forecasting: Automated pipeline for preprocessing new data, retraining the model, and generating predictions for upcoming rounds.
Evaluation: Comprehensive metrics including accuracy, F1-score, ROC-AUC, and confusion matrices, with threshold optimization for improved performance.

**Repository Structure**

data/: Directory for raw CSV files containing player stats and match results (2015–2025).
notebooks/01-afl-match-prediction.ipynb: Main Jupyter notebook covering exploratory data analysis, preprocessing, modeling, evaluation, and predictions.
scripts/FitzRoy.R: R script for data scraping.
results/: Output files, including predictions for Round 24, 2025.

**Prerequisites**

Python 3.13.5+
Required libraries: pandas, numpy, scikit-learn, shap, statsmodels, matplotlib, seaborn, imblearn, fitzRoy

**Installation**

Clone the repository:git clone https://github.com/yourusername/afl-match-prediction.git
cd afl-match-prediction


Install dependencies:pip install -r requirements.txt

Or manually install:pip install pandas numpy scikit-learn shap statsmodels matplotlib seaborn imblearn fitzRoy


Ensure raw data files (footywire_player_stats_*.csv, footywire_match_results_*.csv) are placed in the data/ directory.

**Usage**

Prepare Data: Place historical and new data files in data/, or use fitzRoy to scrape updated AFL statistics from Footywire.
Run the Notebook: Open notebooks/01-afl-match-prediction.ipynb in Jupyter to execute the full pipeline, from data loading to predictions.
Predict New Rounds: Update the round24_games_2025 fixture list in the notebook with new match details (e.g., teams, venue, date) to generate predictions.
View Results: Predictions, including probabilities, are saved in results/ and displayed in the notebook (e.g., round24_predictions).

Example Output
For Round 24, 2025, the model predicts:

Essendon vs. Carlton: Carlton (Away), 73.95% probability.
Collingwood vs. Melbourne: Collingwood (Home), 71.89% probability.
Brisbane vs. Hawthorn: Brisbane (Home), 56.96% probability.

See results/round24_predictions.csv for full output.

**Future Improvements**

Enhanced Data: Integrate real-time data sources (e.g. weather conditions) via APIs.
Draw Prediction: Extend the model to explicitly predict draws (~1-2% of AFL games) using multi-class classification.
Deployment: Develop a Streamlit web app for interactive predictions and visualizations.
Validation: Compare predictions against betting market odds to assess real-world performance.
Feature Expansion: Incorporate advanced player metrics (e.g., pressure acts, player fatigue).

**Limitations**

Draws are currently treated as away losses, which may affect predictions in close matches.
External factors like weather, or crowd effects are not included due to data availability.
Model performance may vary in finals due to higher stakes and different team dynamics.

**Contributing**
Contributions are welcome! To contribute:

Fork the repository.
Create a feature branch (git checkout -b feature/new-feature).
Commit changes (git commit -m 'Add new feature').
Push to the branch (git push origin feature/new-feature).
Open a pull request.

Please ensure code follows PEP 8 style guidelines and includes comments for clarity.
License
This project is licensed under the MIT License. See the LICENSE file for details.
Contact
For questions, bug reports, or suggestions, please open an issue on GitHub or contact [matthewsmax44@gmail.com].

Last updated: August 19, 2025
