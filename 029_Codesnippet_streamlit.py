# main.py
import streamlit as st
from sklearn import datasets
from sklearn.cluster import KMeans
from sklearn.decomposition import PCA
import matplotlib.pyplot as plt

iris = datasets.load_iris()  # data

# begin our app with a markdown text
st.markdown("""# Iris Cluster App
It's so easy to build Machine Learning applications!
""")

# add a slider
n = st.slider("n clusters: ", min_value=2, max_value=10, value=3)

# run model
k_means = KMeans(n_clusters=n)
cluster_labels = k_means.fit_predict(iris.data)

# visualize results
pca = PCA(n_components=2).fit_transform(iris.data)  # transform to 2D

plt.scatter(pca[:, 0], pca[:, 1], c=cluster_labels)
st.pyplot()  # display graph in app
