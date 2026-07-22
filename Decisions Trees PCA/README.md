#  Decision Tree Classification with PCA on the MNIST Dataset

##  Project Overview

This project demonstrates the application of **Principal Component Analysis (PCA)** for dimensionality reduction and **Decision Tree Classification** for handwritten digit recognition using the **MNIST dataset**.

The objective is to reduce the dimensionality of the original images while preserving the most important information, train a Decision Tree classifier on the transformed data, and evaluate its performance.

---

##  Objectives

- Load and preprocess the MNIST handwritten digit dataset.
- Reduce the dimensionality of the images using PCA.
- Train a Decision Tree classifier.
- Evaluate classification performance.
- Analyze the impact of dimensionality reduction on model accuracy.

---

##  Dataset

**Dataset:** MNIST Handwritten Digits

The MNIST dataset contains grayscale images of handwritten digits (0–9).

- **Classes:** 10
- **Image Size:** 28 × 28 pixels
- **Features:** 784 pixels per image
- **Training Samples:** 10,000 (subset)
- **Testing Samples:** 2,000 (subset)

Dataset source:

- TensorFlow / Keras (`keras.datasets.mnist`)

---

##  Technologies Used

- Python
- NumPy
- Scikit-learn
- TensorFlow / Keras
- Matplotlib
- Jupyter Notebook

---

##  Machine Learning Workflow

The notebook follows the complete machine learning pipeline:

1. Load the MNIST dataset
2. Preprocess image data
3. Split the dataset into training and testing sets
4. Apply Principal Component Analysis (PCA)
5. Train a Decision Tree classifier
6. Predict handwritten digits
7. Evaluate classification performance

---

##  Machine Learning Algorithms

### Principal Component Analysis (PCA)

PCA is used to reduce the dimensionality of the original 784 image features while retaining most of the information contained in the dataset.

### Decision Tree Classifier

A Decision Tree classifier is trained on the PCA-transformed dataset to classify handwritten digits.

---

##  Model Evaluation

The model is evaluated using classification metrics such as:

- Accuracy
- Classification Report
- Confusion Matrix (if included)
- Prediction Results

---

##  Project Structure

```text
decision-tree-pca-mnist/
│
├── data/
├── notebooks/
│   └── decision_tree_pca_mnist.ipynb
├── README.md
├── requirements.txt
└── .gitignore
```

---

##  Installation

Clone the repository:

```bash
git clone https://github.com/loukasNtasios/decision-tree-pca-mnist.git
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
notebooks/decision_tree_pca_mnist.ipynb
```

---

##  Requirements

```text
tensorflow
numpy
matplotlib
scikit-learn
jupyter
```

---

##  Results

The project demonstrates how dimensionality reduction using PCA can significantly reduce computational complexity while maintaining good classification performance.

Example visualizations that can be included:

- Sample MNIST images
- PCA explained variance
- Confusion Matrix
- Classification Report
- Predicted digit examples



---

##  Skills Demonstrated

- Machine Learning
- Decision Trees
- Principal Component Analysis (PCA)
- Dimensionality Reduction
- Image Classification
- Data Preprocessing
- Model Evaluation
- Python Programming
- Scikit-learn
- TensorFlow / Keras

---

##  Future Improvements

- Compare Decision Trees with Random Forests
- Evaluate Support Vector Machines (SVM)
- Train a Neural Network on the same dataset
- Optimize PCA components using cross-validation
- Compare model performance before and after PCA

---

##  Author

**Loukas Ntasios**

M.Sc. Data Science & Machine Learning

