import skimage.io as io
import matplotlib.pyplot as plot

def subplot_figures():
	img1 = io.imread('images/cell.tif')
	img2 = io.imread('images/onion.png')
	
	plot.subplot(2, 1, 1)
	io.imshow(img1)
	#io.show()

	plot.subplot(2, 1, 2)
	io.imshow(img2)
	io.show()


subplot_figures()

