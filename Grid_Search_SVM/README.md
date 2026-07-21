# 🔍 Breast Cancer Classification using Support Vector Machines (SVM)

##  Overview

This project demonstrates the implementation and optimization of a **Support Vector Machine (SVM)** classifier for breast cancer diagnosis using the **Breast Cancer Wisconsin Dataset** from scikit-learn.

The primary objective is to build a reliable classification model and improve its performance through **hyperparameter tuning with Grid Search Cross-Validation (GridSearchCV)**.

---

##  Objectives

- Train an SVM classifier for binary classification.
- Preprocess the dataset using feature scaling.
- Optimize model performance using Grid Search.
- Compare different combinations of hyperparameters.
- Evaluate the final model using appropriate classification metrics.

---

##  Dataset

**Dataset:** Breast Cancer Wisconsin Dataset

The dataset contains measurements extracted from digitized images of breast mass cell nuclei.

- **Samples:** 569
- **Features:** 30 numerical features
- **Classes:**
  - Malignant
  - Benign

Source:

- `sklearn.datasets.load_breast_cancer()`

---

##  Technologies Used

- Python
- NumPy
- Matplotlib
- Scikit-learn
- Jupyter Notebook

---

##  Machine Learning Workflow

The notebook follows a complete supervised machine learning pipeline:

1. Load the dataset
2. Explore the data
3. Split into training and testing sets
4. Standardize the features
5. Train an initial SVM classifier
6. Optimize hyperparameters using GridSearchCV
7. Evaluate the optimized model
8. Compare performance metrics

---

##  Hyperparameter Optimization

Grid Search is used to automatically search for the optimal combination of SVM parameters.

Typical parameters explored include:

- Kernel
- C
- Gamma

The best model is selected using cross-validation.

---

##  Evaluation Metrics

Model performance is evaluated using:

- F1 Score
- Cross Validation
- Training Accuracy
- Test Accuracy

---

##  Project Structure

```text
breast-cancer-svm/
│
├── data/
├── notebooks/
│   └── Grid_Search_SVM.ipynb
├── images/
├── README.md
├── requirements.txt
└── .gitignore
```

---

##  Installation

Clone the repository

```bash
git clone https://github.com/YOUR_USERNAME/breast-cancer-svm.git
```

Install the required packages

```bash
pip install -r requirements.txt
```

Launch Jupyter Notebook

```bash
jupyter notebook
```

Open

```text
notebooks/Grid_Search_SVM.ipynb
```

---

##  Requirements

- numpy
- matplotlib
- scikit-learn
- jupyter

---

##  Skills Demonstrated

- Machine Learning
- Support Vector Machines (SVM)
- Hyperparameter Tuning
- Grid Search Cross Validation
- Data Preprocessing
- Feature Scaling
- Model Evaluation
- Python Programming
- Scikit-learn

---

##  Results

This project demonstrates how hyperparameter optimization can improve the predictive performance of an SVM classifier by selecting the best model configuration through cross-validation.



---

##  Future Improvements

- Compare SVM with Random Forest and Logistic Regression
- Apply RandomizedSearchCV
- Visualize the decision boundary
- Perform feature selection
- Export the trained model using Joblib

---

##  Author

**Loukas Ntasios**

M.Sc. Data Science & Machine Learning

