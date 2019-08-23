import skimage.io as io

def convertImageType():
    originalImage = io.imread('images/bowl_fruit.png')
    io.imsave('images/bowl_fruit.jpeg', originalImage)

    changedImage = io.imread('images/bowl_fruit.jpeg')
    io.imshow(changedImage)
    io.show()

convertImageType()

