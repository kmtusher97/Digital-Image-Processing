x = imread('_images/bins.jpeg');
figure, imshow(x), impixelinfo;

% size of the image
size(x)

% pixel 
x(100, 230, 1)

% pixel value of the colors
x(100, 230, :)

% information of the image
% use file path directly
imfinfo('_images/bins.jpeg')

% convert in gray
g = rgb2gray(x);
figure, imshow(g);

% convert image into another type
imwrite(x, '_images/bins.png');
figure, imshow('_images/bins.png');