import skimage.io as IO

a = IO.imread('images/onion.png')
IO.imshow(a)
IO.show()

print('shape of image', a.shape)
print('pixel value of 26 56', a[26, 56, :])
