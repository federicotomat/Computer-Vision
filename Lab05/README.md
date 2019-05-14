# Normalized Cross Correlation

Normalized cross-correlation is a rather simple formula that describes the similarity of two signals. As such, it serves well for searching a known pattern in an image. You can use it when looking for a specific face in a photograph or for a letter in a scanned document. However in its pure generality, the formula can be used to countless tasks completely unrelated to computer vision.

A downside is that cross-correlation can hardly account for rotation or other deformations. If you need to find a way around that, it will usually not be by far as pretty.

Each possible location of the searched pattern is evaluated, and we can even get results more precise than the pixel level. Cross-correlation might well be the simplest thing to calculate for the purpose and the normalization we use is the most profound normalization all around. That formula to evaluate is one single step and outputs clear values between −1 and 1. No parameters involved. Apart from simple arithmetic, the only computation performed is Fast Fourier Transform or Time domain Convolution where the latter one method is the one used in this assignment.