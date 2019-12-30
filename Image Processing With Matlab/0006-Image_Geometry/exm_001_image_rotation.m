c = imread('_image/cub.jpg');
figure, imshow(c);

cr = imrotate(c, 60);
figure, imshow(cr);