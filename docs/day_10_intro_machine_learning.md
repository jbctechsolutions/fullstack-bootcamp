# Day 10: Introduction to Machine Learning (Optional)

## 🎯 Learning Objectives
By the end of this day, you will:
- Understand the basics of machine learning and its applications
- Distinguish between supervised and unsupervised learning
- Use scikit-learn for simple ML tasks
- Evaluate model performance

## 📝 Key Concepts

### 1. What is Machine Learning?
- [Machine Learning Basics](https://scikit-learn.org/stable/tutorial/basic/tutorial.html)
- [Types of Machine Learning](https://www.ibm.com/cloud/learn/machine-learning)

### 2. Supervised vs. Unsupervised Learning
- [Supervised Learning](https://scikit-learn.org/stable/supervised_learning.html)
- [Unsupervised Learning](https://scikit-learn.org/stable/unsupervised_learning.html)

### 3. scikit-learn Basics
- [scikit-learn User Guide](https://scikit-learn.org/stable/user_guide.html)
- [Quickstart](https://scikit-learn.org/stable/getting_started.html)

### 4. Model Evaluation
- [Model Evaluation Metrics](https://scikit-learn.org/stable/modules/model_evaluation.html)

## 💻 Practice Exercises

### Exercise 1: Simple Regression
#### Deliverables
1. Use scikit-learn to fit a linear regression model to a dataset.
#### Success Criteria
- Model fits and predicts correctly
- Results are interpreted
#### Hints
- Use `LinearRegression` from scikit-learn
#### Resources
- [Linear Regression Example](https://scikit-learn.org/stable/auto_examples/linear_model/plot_ols.html)
- [Starter Notebook](../notebooks/day_10_intro_machine_learning_starter.ipynb)
- [Example Dataset: Iris](../data/iris.csv)

### Exercise 2: Simple Classification
#### Deliverables
1. Use scikit-learn to fit a classifier (e.g., KNN or logistic regression).
#### Success Criteria
- Model classifies data correctly
- Accuracy is measured
#### Hints
- Use `KNeighborsClassifier` or `LogisticRegression`
#### Resources
- [Classification Example](https://scikit-learn.org/stable/auto_examples/classification/plot_classifier_comparison.html)
- [Starter Notebook](../notebooks/day_10_intro_machine_learning_starter.ipynb)
- [Example Dataset: Iris](../data/iris.csv)

### Exercise 3: Model Evaluation
#### Deliverables
1. Evaluate model performance using appropriate metrics.
#### Success Criteria
- Metrics (accuracy, RMSE, etc.) are calculated
- Results are interpreted
#### Hints
- Use `accuracy_score`, `mean_squared_error`
#### Resources
- [Model Evaluation](https://scikit-learn.org/stable/modules/model_evaluation.html)
- [Starter Notebook](../notebooks/day_10_intro_machine_learning_starter.ipynb)

## 🔍 Validation Checklist
Before proceeding to the next day, verify:
- Can fit and interpret a regression model
- Can fit and interpret a classification model
- Can evaluate model performance 