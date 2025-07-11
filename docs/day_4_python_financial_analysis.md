# Day 4: Python for Financial Analysis

## 🎯 Learning Objectives
By the end of this day, you will:
- Understand the basics of financial data and time series
- Use pandas for time series analysis
- Perform basic financial calculations (returns, moving averages)
- Visualize financial data
- Complete a mini project analyzing stock price data

## 📝 Key Concepts

### 1. Financial Data Basics
- [What is Financial Data?](https://www.investopedia.com/terms/f/financial-statements.asp)
- [Types of Financial Data](https://www.investopedia.com/terms/f/financial-data.asp)

### 2. pandas for Time Series
- [pandas Time Series](https://pandas.pydata.org/pandas-docs/stable/user_guide/timeseries.html)
- [Working with Dates in pandas](https://realpython.com/python-datetime/)

### 3. Financial Calculations
- [Calculating Returns](https://www.investopedia.com/terms/r/return.asp)
- [Moving Averages](https://www.investopedia.com/terms/m/movingaverage.asp)

### 4. Data Visualization for Finance
- [matplotlib for Finance](https://matplotlib.org/stable/gallery/lines_bars_and_markers/finance_workflow.html)
- [seaborn for Time Series](https://seaborn.pydata.org/examples/timeseries_facets.html)

### 5. Stock Price Analysis Project
- [Yahoo Finance API](https://pypi.org/project/yfinance/)
- [pandas-datareader](https://pandas-datareader.readthedocs.io/en/latest/)

## 💻 Practice Exercises

### Exercise 1: Load Financial Data
#### Deliverables
1. Load historical stock price data into pandas (using yfinance or pandas-datareader).
#### Success Criteria
- Data loads without errors
- DataFrame contains expected columns (Date, Open, Close, etc.)
#### Hints
- Use `yfinance.download()` or `pandas_datareader.data.DataReader()`
#### Resources
- [yfinance Quickstart](https://pypi.org/project/yfinance/)
- [pandas-datareader Docs](https://pandas-datareader.readthedocs.io/en/latest/)
- [Starter Notebook](../notebooks/day_4_python_financial_analysis_starter.ipynb)
- [Example Dataset: Sample Stocks](../data/stocks_sample.csv)

### Exercise 2: Calculate Returns and Moving Averages
#### Deliverables
1. Calculate daily returns and moving averages for a stock.
#### Success Criteria
- Returns and moving averages are added as new columns
- Calculations are correct
#### Hints
- Use `df['Return'] = df['Close'].pct_change()`
- Use `df['MA20'] = df['Close'].rolling(20).mean()`
#### Resources
- [pandas pct_change](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.pct_change.html)
- [pandas rolling](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.rolling.html)
- [Starter Notebook](../notebooks/day_4_python_financial_analysis_starter.ipynb)

### Exercise 3: Visualize Financial Data
#### Deliverables
1. Visualize stock prices, returns, and moving averages.
#### Success Criteria
- Plots are clear and labeled
- Trends are visible
#### Hints
- Use `plt.plot()` for line charts
- Use `df.plot()` for quick visualization
#### Resources
- [matplotlib Line Plot](https://matplotlib.org/stable/gallery/lines_bars_and_markers/line_styles_reference.html)
- [pandas Plotting](https://pandas.pydata.org/pandas-docs/stable/user_guide/visualization.html)
- [Starter Notebook](../notebooks/day_4_python_financial_analysis_starter.ipynb)

### Exercise 4: Mini Project - Stock Analysis
#### Deliverables
1. Analyze a stock's performance over time (choose a stock, load data, calculate metrics, visualize trends).
#### Success Criteria
- Analysis is complete and documented in a Jupyter notebook
- Insights are clearly presented
#### Hints
- Combine all previous steps
- Try different stocks for comparison
#### Resources
- [Jupyter Notebook Tips](https://realpython.com/jupyter-notebook-introduction/)
- [Starter Notebook](../notebooks/day_4_python_financial_analysis_starter.ipynb)

## 🔍 Validation Checklist
Before proceeding to Day 5, verify:
- Financial data loaded and explored
- Returns and moving averages calculated
- Visualizations created for key metrics
- Mini project completed and documented 