# Day 8: Exploratory Data Analysis & Data Storytelling

## 🎯 Learning Objectives
By the end of this day, you will:
- Understand the EDA process and its importance
- Use Python tools to explore and summarize data
- Visualize data for insight and communication
- Tell a compelling story with data

## 📝 Key Concepts

### 1. Exploratory Data Analysis (EDA)
- [What is EDA?](https://towardsdatascience.com/exploratory-data-analysis-8fc1cb20fd15)
- [EDA with pandas](https://pandas.pydata.org/pandas-docs/stable/user_guide/visualization.html)

### 2. Data Visualization
- [Choosing the Right Chart](https://www.data-to-viz.com/)
- [Seaborn for EDA](https://seaborn.pydata.org/tutorial.html)

### 3. Data Storytelling
- [Data Storytelling Guide](https://www.tableau.com/learn/articles/data-storytelling)
- [Storytelling with Data](https://www.storytellingwithdata.com/)

## 💻 Practice Exercises

### Exercise 1: EDA on a Real Dataset
#### Deliverables
1. Perform EDA on a provided dataset (summary stats, missing values, distributions).
#### Success Criteria
- Key characteristics of the data are identified
- Issues (missing values, outliers) are noted
#### Hints
- Use `df.describe()`, `df.isnull().sum()`, `df.hist()`
#### Resources
- [pandas EDA Examples](https://realpython.com/pandas-python-explore-dataset/)
- [Starter Notebook](../notebooks/day_8_eda_storytelling_starter.ipynb)
- [Example Dataset: Titanic](../data/titanic.csv)

### Exercise 2: Data Visualization
#### Deliverables
1. Create at least three different types of plots to explore relationships in the data.
#### Success Criteria
- Plots are clear and informative
- Visualizations reveal insights
#### Hints
- Try scatterplots, boxplots, pairplots
#### Resources
- [Seaborn Plot Gallery](https://seaborn.pydata.org/examples/index.html)
- [Starter Notebook](../notebooks/day_8_eda_storytelling_starter.ipynb)

### Exercise 3: Data Storytelling
#### Deliverables
1. Present a short narrative using your EDA and visualizations.
#### Success Criteria
- Story is clear and supported by data
- Visuals enhance the narrative
#### Hints
- Focus on a key insight or question
- Use markdown cells in Jupyter for narrative
#### Resources
- [Storytelling with Data Blog](https://www.storytellingwithdata.com/blog)
- [Starter Notebook](../notebooks/day_8_eda_storytelling_starter.ipynb)

## 🔍 Validation Checklist
Before proceeding to the next day, verify:
- EDA performed on a real dataset
- Multiple visualizations created
- Data story presented clearly 