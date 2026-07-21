#  Fashion MNIST CNN Analysis

##  Project Overview

This project investigates how different regions of an image contribute to image classification performance using the Fashion MNIST dataset and Convolutional Neural Networks (CNNs).

The study compares model performance when training on:

- Top-half image information
- Bottom-half image information
- Complete image information

The objective is to evaluate how much discriminative information is contained in different parts of fashion product images and analyze the impact on classification accuracy.

---

##  Dataset

**Fashion MNIST**

Fashion MNIST is a dataset of 70,000 grayscale images of clothing items belonging to 10 classes.

Classes include:

- T-shirt / Top
- Trouser
- Pullover
- Dress
- Coat
- Sandal
- Shirt
- Sneaker
- Bag
- Ankle Boot

Image size:

```text
28 × 28 pixels
```

Dataset split:

```text
60,000 training images
10,000 test images
```

---

##  Objectives

This project aims to:

- Explore the Fashion MNIST dataset
- Compare classification performance using partial image information
- Evaluate CNN performance under different input conditions
- Analyze misclassified examples
- Investigate overfitting behavior
- Improve generalization using Early Stopping

---

##  Deep Learning Models

### Model 1 – Top-Half Images

A CNN was trained using only the upper half of each image.

The experiment evaluates how much information is contained in the upper clothing region.

---

### Model 2 – Bottom-Half Images

A CNN was trained using only the lower half of each image.

The experiment evaluates how much information is contained in the lower clothing region.

---

### Model 3 – Extended CNN Architecture

A deeper CNN architecture was implemented with additional dense layers to improve classification performance.

---

### Model 4 – CNN with Early Stopping

Early Stopping was introduced to reduce overfitting and improve generalization performance.

---

##  Analysis Performed

- Dataset exploration
- Class distribution analysis
- Pixel normalization
- Image segmentation
- CNN training
- Classification reports
- Accuracy comparison
- Error analysis
- Misclassification visualization
- Overfitting detection
- Early Stopping evaluation

---

##  Results

Key findings:

- Both image halves contain useful classification information.
- Certain classes can be recognized reliably from partial image information.
- The deeper network improves performance but shows signs of overfitting.
- Early Stopping significantly improves generalization and overall model performance.
- Different classes depend on different image regions for accurate classification.

---

## 🛠 Technologies

- Python
- TensorFlow
- Keras
- NumPy
- Pandas
- Matplotlib
- Scikit-learn
- Jupyter Notebook

---

##  Project Structure

```text
fashion-mnist-cnn-analysis/
│
├── notebooks/
│   └── Fashion_mnist.ipynb
│
├── README.md
├── requirements.txt
└── .gitignore
```

---

##  Installation

Clone the repository:

```bash
git clone https://github.com/YOUR_USERNAME/fashion-mnist-cnn-analysis.git
```

Install dependencies:

```bash
pip install -r requirements.txt
```

Launch Jupyter:

```bash
jupyter notebook
```

Open:

```text
notebooks/fashion_mnist.ipynb
```

---

##  Skills Demonstrated

- Deep Learning
- Computer Vision
- Convolutional Neural Networks (CNN)
- Image Processing
- TensorFlow / Keras
- Model Evaluation
- Classification Analysis
- Overfitting Detection
- Early Stopping
- Data Visualization

---

##  Author

Loukas Ntasios

MSc Data Science and Machine Learning

