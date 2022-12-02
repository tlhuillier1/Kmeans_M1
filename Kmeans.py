# import packages
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans
from sklearn.decomposition import PCA
from sklearn.preprocessing import StandardScaler

data = pd.read_csv('all_e.csv')
data_standard = data.drop(data.columns[0], axis=1)
X = data_standard[data_standard.columns.drop(list(data_standard.filter(regex='brand')))]
X = X[X.columns.drop(list(X.filter(regex='model')))]
print(X)

# Select optimal K (elbow method)
sum_of_squared = []
for k in range(1,11):
    kmeans = KMeans(n_clusters=k)
    kmeans.fit(X)
    sum_of_squared.append(kmeans.inertia_) # sum of squared distances
    
plt.plot(range(1, 11), sum_of_squared)
plt.xticks(range(1,11))
plt.xlabel('Number of clusters')
plt.ylabel('Total within cluster sum of squares')
plt.title('The elbow method showing optimal K')
plt.show()

from sklearn import cluster
# Vérifie le nombre de clusters optimal 
import sklearn.metrics as metrics
SK = range(3,12)
sil_score = []
for i in SK:
    labels=KMeans(n_clusters=i,init="k-means++",random_state=200).fit(X).labels_
    score = metrics.silhouette_score(X,labels,metric="euclidean",sample_size=1000,random_state=200)
    sil_score.append(score)
    print ("Silhouette score for k(clusters) = "+str(i)+" is "
           +str(metrics.silhouette_score(X,labels,metric="euclidean",sample_size=1000,random_state=200)))
           
# Train the model
k_means = KMeans(n_clusters=4)
k_means_model = k_means.fit(X)

# Calcul des centroïdes des clusters
print(k_means_model.cluster_centers_)
