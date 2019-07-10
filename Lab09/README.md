# Image Matching and Retrival

## Image  ##

Features matching or generally image matching, a part of many computer vision applications such as image registration, camera calibration and object recognition, is the task of establishing correspondences between two images of the same scene/object. A common approach to image matching consists of detecting a set of interest points each associated with image descriptors from image data. Once the features and their descriptors have been extracted from two or more images, the next step is to establish some preliminary feature matches between these images.
Generally, the performance of matching methods based on interest points depends on both the properties of the underlying interest points and the choice of associated image descriptors. Thus, detectors and descriptors appropriate for images contents shall be used in applications. For instance, if an image contains bacteria cells, the blob detector should be used rather than the corner detector. But, if the image is an aerial view of a city, the corner detector is suitable to find man-made structures. Furthermore, selecting a detector and a descriptor that addresses the image degradation is very important.

## Image Retrival ##

Image retrieval is a task of searching similar images of a certain type from the image datasets. In recent years real-life applications of image retrieval has gained a great interest in the research area. Content-based image retrieval (CBIR) is a widespread technique gradually applied in retrieval systems. In CBIR, images retrieval is done by using visual characteristics also known as features, extracted from the database. CBIR system's retrieval accuracy and efficiency rely greatly on the adopted visual feature. Visual features may describe numerous properties of either low-level features include shape, coloR, spatial relationship and texture, or high-level features also called semantic features. Earlier research in CBIR motivate encoding the spatial arrangement of colors due to the problem of having several diverse images with identical or similar color histograms. Now this problem is being reconsidered with the visual dictionary model which takes documents as bag-of-words. This model has numerous important advantages including compactness and invariance to the image or the scene transformations and is one of the most famous feature representations in the CBIR framework.

## How run ##
First of all you have to run the path_config e poi
In the main folder you find two subfolders:

ImageMatching: the file Lab9_part1.m allows you to compute the matching between a pair of images using corner keypoints represented with SIFT descriptors. The matching is based on an affinity matrix including the similarities between keypoints comparing their position and appearance (using euclidean distance and Normalized-Cross Correlation) or their SIFT descriptors.

ImageRetrieval: the file Lab9_part2.m implements a solution for image retrieval using a representation based on SIFT descriptors and the bag-of-keypoints paradigm.  
