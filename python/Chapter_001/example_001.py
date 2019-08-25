import skimage.io as io


# Example 001
def read_image_access_image_info():
    a = io.imread('images/onion.png')
    io.imshow(a)
    io.show()

    print('shape of image', a.shape)
    print('pixel value of 26 56', a[26, 56, :])


read_image_access_image_info()