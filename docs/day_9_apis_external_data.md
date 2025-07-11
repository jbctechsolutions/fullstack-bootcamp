# Day 9: Working with APIs and External Data

## 🎯 Learning Objectives
By the end of this day, you will:
- Understand what APIs are and why they matter for data analysis
- Use Python to access and retrieve data from APIs
- Parse and process JSON data
- Integrate external data into your analysis

## 📝 Key Concepts

### 1. APIs and Data Access
- [What is an API?](https://www.ibm.com/cloud/learn/api)
- [REST API Basics](https://restfulapi.net/)

### 2. Python for API Requests
- [Python requests Library](https://requests.readthedocs.io/en/latest/)
- [Working with JSON in Python](https://realpython.com/python-json/)

### 3. Data Integration
- [Combining Data from Multiple Sources](https://www.dataquest.io/blog/data-merging-and-joining-pandas/)

## 💻 Practice Exercises

### Exercise 1: Accessing an API
#### Deliverables
1. Use Python to make a GET request to a public API and retrieve data.
#### Success Criteria
- Data is successfully retrieved and displayed
#### Hints
- Use the `requests.get()` function
#### Resources
- [requests Quickstart](https://requests.readthedocs.io/en/latest/user/quickstart/)
- [Starter Notebook](../notebooks/day_9_apis_external_data_starter.ipynb)
- [Sample API Response](../data/sample_api_response.json)

### Exercise 2: Parsing JSON Data
#### Deliverables
1. Parse the JSON response and extract relevant information.
#### Success Criteria
- JSON data is parsed and key fields are extracted
#### Hints
- Use `.json()` method on the response object
#### Resources
- [Working with JSON](https://realpython.com/python-json/)
- [Starter Notebook](../notebooks/day_9_apis_external_data_starter.ipynb)
- [Sample API Response](../data/sample_api_response.json)

### Exercise 3: Data Integration
#### Deliverables
1. Merge API data with an existing pandas DataFrame.
#### Success Criteria
- Data is merged correctly
- Analysis incorporates both sources
#### Hints
- Use `pd.merge()` or `pd.concat()`
#### Resources
- [pandas Merge](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.merge.html)
- [Starter Notebook](../notebooks/day_9_apis_external_data_starter.ipynb)

## 🔍 Validation Checklist
Before proceeding to the next day, verify:
- Can access and retrieve data from an API
- Can parse and process JSON data
- Can integrate external data into analysis 