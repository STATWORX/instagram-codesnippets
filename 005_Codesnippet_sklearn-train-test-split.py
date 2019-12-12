""" Simulate classification data and split into train and test """

from sklearn.model_selection import train_test_split
from sklearn.datasets import make_classification

# Simulate data
X, y = make_classification(n_samples=1000,
                           n_feature=20,
                           n_informative=5)

# Split into train and test partition
X_train, X_test, y_train, y_test = train_test_split(X, y)