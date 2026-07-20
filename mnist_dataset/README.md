# Even vs Odd Digit Classification



A machine learning project that classifies handwritten digits from the MNIST dataset as **even** or **odd** using Logistic Regression. This project demonstrates a complete MLOps workflow including data preprocessing, model training, evaluation, and error analysis.



##  Overview

This project transforms the classic MNIST digit classification problem into a binary classification task. Instead of predicting the exact digit (0-9), the model determines whether a digit is even or odd. This simplification allows for:

- Understanding binary classification fundamentals
- Exploring Logistic Regression as a baseline model
- Learning to evaluate classification models
- Visualizing model performance with confusion matrices

### Problem Statement
> Given a 28x28 grayscale image of a handwritten digit, predict whether the digit is **even** (0, 2, 4, 6, 8) or **odd** (1, 3, 5, 7, 9).

### Key Findings
- True Negatives: 4,835 odd digits correctly classified as odd

- True Positives: 4,872 even digits correctly classified as even

- False Positives: 143 odd digits misclassified as even

- False Negatives: 150 even digits misclassified as odd

### Model Performance
Metric	     Score
Accuracy	 0.972
Precision	 0.973
Recall	     0.971
F1-Score	 0.972

##  Features

- **Data Loading**: Automatic download and preprocessing of MNIST dataset
- **Binary Classification**: Converts 10-class problem to 2-class (even/odd)
- **Model Pipeline**: StandardScaler + Logistic Regression
- **Cross-Validation**: 3-fold CV for robust performance evaluation
- **Comprehensive Metrics**: Accuracy, Precision, Recall, F1-Score
- **Visual Analytics**: Professional confusion matrices with heatmaps
- **Error Analysis**: Identification of false positives and negatives
- **Reproducibility**: Fixed random seed for consistent results

##  Technologies Used

| Category | Technologies |
|----------|-------------|
| **Core** | Python 3.8+ |
| **ML Framework** | scikit-learn |
| **Data Processing** | NumPy, Pandas |
| **Visualization** | Matplotlib, Seaborn |
| **Development** | Jupyter Notebook, Git |

### Key Libraries
```python
- scikit-learn==1.0.0+
- numpy==1.21.0+
- pandas==1.3.0+
- matplotlib==3.4.0+
- seaborn==0.11.0+

##  Author

Loukas Ntasios