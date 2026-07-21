#  Linear Regression Model with Learning Curve Analysis

##  Project Overview

This project demonstrates the implementation and evaluation of a **Linear Regression** model using **Scikit-learn**.

The objective is to build a predictive regression model, evaluate its performance, and analyze its learning behavior using **learning curves**. The project follows a complete machine learning workflow, including data preprocessing, feature scaling, model training, and performance visualization.

---

##  Objectives

- Build a Linear Regression model for prediction.
- Standardize numerical features.
- Split the dataset into training and testing sets.
- Train and evaluate the regression model.
- Analyze model performance using learning curves.
- Understand the relationship between training size and prediction error.

---

## 🛠 Technologies Used

- Python
- NumPy
- Matplotlib
- Scikit-learn
- Jupyter Notebook

---

##  Machine Learning Workflow

The project follows these steps:

1. Import and inspect the dataset
2. Prepare input features and target variable
3. Standardize the data using `StandardScaler`
4. Split the dataset into training and testing sets
5. Train a Linear Regression model
6. Generate learning curves
7. Evaluate model performance

---

##  Model

The project uses the following machine learning algorithm:

- **Linear Regression**

The model is trained using Scikit-learn's implementation:

```python
LinearRegression()
```

---

##  Performance Evaluation

The project evaluates the model using learning curves to visualize:

- Training Error
- Validation Error

Learning curves help determine whether the model is:

- Underfitting
- Overfitting
- Generalizing well

---

##  Project Structure

```text
linear-regression-analysis/
│
├── data/
├── notebooks/
│   └── linear_regression.ipynb
├── images/
├── README.md
├── requirements.txt
└── .gitignore
```

---

##  Installation

Clone the repository:

```bash
git clone https://github.com/YOUR_USERNAME/linear-regression-analysis.git
```

Install the required packages:

```bash
pip install -r requirements.txt
```

Launch Jupyter Notebook:

```bash
jupyter notebook
```

Open:

```text
notebooks/linear_regression.ipynb
```

---

##  Requirements

```
numpy
matplotlib
scikit-learn
jupyter
```

---

##  Results

The notebook includes:

- Data preprocessing
- Feature scaling
- Linear Regression model training
- Learning Curve visualization
- Model performance analysis



Example:

```markdown
## Learning Curve

![Learning Curve](images/learning_curve.png)
```

---

##  Skills Demonstrated

- Machine Learning
- Linear Regression
- Data Preprocessing
- Feature Scaling
- Model Evaluation
- Learning Curves
- Python Programming
- Scikit-learn
- Data Visualization

---

##  Future Improvements

- Compare Linear Regression with Ridge and Lasso Regression
- Perform feature selection
- Apply cross-validation
- Evaluate additional regression metrics (MAE, RMSE, R²)
- Optimize preprocessing pipeline using Scikit-learn Pipelines

---

##  Author

**Loukas Ntasios**

M.Sc. Data Science & Machine Learning

