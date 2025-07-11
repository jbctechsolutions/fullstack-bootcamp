# Day 3: Python for Data Analysis

## 🎯 Learning Objectives
By the end of this day, you will:
- Understand the basics of using Python for data analysis
- Work with Jupyter notebooks for interactive analysis
- Manipulate data using pandas and numpy
- Clean and preprocess data
- Visualize data using matplotlib or seaborn

## 📝 Key Concepts

### 1. Python for Data Analysis
- [Why Python for Data Science?](https://www.datacamp.com/tutorial/python-data-science)
- [Python Basics](https://docs.python.org/3/tutorial/index.html)

### 2. Jupyter Notebooks
- [Jupyter Notebook Beginner Guide](https://realpython.com/jupyter-notebook-introduction/)
- [Project Jupyter](https://jupyter.org/)

### 3. pandas Basics
- [pandas Documentation](https://pandas.pydata.org/docs/)
- [10 Minutes to pandas](https://pandas.pydata.org/pandas-docs/stable/user_guide/10min.html)

### 4. numpy Basics
- [numpy Quickstart](https://numpy.org/doc/stable/user/quickstart.html)
- [numpy for Data Analysis](https://realpython.com/numpy-array-programming/)

### 5. Data Cleaning
- [Data Cleaning with pandas](https://realpython.com/python-data-cleaning-numpy-pandas/)

### 6. Data Visualization
- [matplotlib Tutorial](https://matplotlib.org/stable/tutorials/introductory/pyplot.html)
- [seaborn Tutorial](https://seaborn.pydata.org/tutorial.html)

## 💻 Practice Exercises

### Exercise 1: Jupyter Notebook Setup
#### Deliverables
1. Launch a Jupyter notebook and run basic Python code.
#### Success Criteria
- Jupyter notebook runs without errors
- Basic Python code executes successfully
#### Hints
- Use `jupyter notebook` command in your terminal
- Try simple print statements and variable assignments
#### Resources
- [Jupyter Installation Guide](https://jupyter.org/install)
- [Starter Notebook](../notebooks/day_3_python_data_analysis_starter.ipynb)
- [Example Dataset: Titanic](../data/titanic.csv)

### Exercise 2: pandas DataFrames
#### Deliverables
1. Load a CSV file into a pandas DataFrame and perform basic analysis (head, describe, info).
#### Success Criteria
- DataFrame loads correctly
- Basic analysis functions return expected results
#### Hints
- Use `pd.read_csv()`
- Try `df.head()`, `df.describe()`, `df.info()`
#### Resources
- [pandas IO Tools](https://pandas.pydata.org/pandas-docs/stable/user_guide/io.html)
- [Starter Notebook](../notebooks/day_3_python_data_analysis_starter.ipynb)
- [Example Dataset: Titanic](../data/titanic.csv)

### Exercise 3: numpy Arrays
#### Deliverables
1. Use numpy to perform array operations (creation, slicing, basic math).
#### Success Criteria
- Arrays are created and manipulated as expected
- Basic operations (sum, mean, etc.) work
#### Hints
- Use `np.array()`, `np.mean()`, `np.sum()`
#### Resources
- [numpy Array Basics](https://numpy.org/doc/stable/user/basics.creation.html)
- [Starter Notebook](../notebooks/day_3_python_data_analysis_starter.ipynb)

### Exercise 4: Data Cleaning
#### Deliverables
1. Clean a sample dataset (handle missing values, filter rows).
#### Success Criteria
- Missing values are handled (dropped or filled)
- Data is filtered based on conditions
#### Hints
- Use `df.dropna()`, `df.fillna()`, boolean indexing
#### Resources
- [pandas Data Cleaning](https://pandas.pydata.org/pandas-docs/stable/user_guide/missing_data.html)
- [Starter Notebook](../notebooks/day_3_python_data_analysis_starter.ipynb)

### Exercise 5: Data Visualization
#### Deliverables
1. Create a simple plot using matplotlib or seaborn.
#### Success Criteria
- Plot is generated and displayed in the notebook
- Visualization is clear and labeled
#### Hints
- Use `plt.plot()`, `sns.histplot()`
#### Resources
- [matplotlib Pyplot](https://matplotlib.org/stable/api/pyplot_api.html)
- [seaborn API](https://seaborn.pydata.org/api.html)
- [Starter Notebook](../notebooks/day_3_python_data_analysis_starter.ipynb) 