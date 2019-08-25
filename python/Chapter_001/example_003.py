import skimage.io as io


# Example 003
def convert_image_type():
    original_image = io.imread('images/bowl_fruit.png')
    io.imsave('images/bowl_fruit.jpeg', original_image)

    changed_image = io.imread('images/bowl_fruit.jpeg')
    io.imshow(changed_image)
    io.show()


convert_image_type()