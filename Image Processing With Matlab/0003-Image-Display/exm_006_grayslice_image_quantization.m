%%
%{
If we wish to precisely specify the number of output grayscales, 
then we can use the grayslice function. Given an image matrix x 
and an integer n, the MATLAB command grayslice(x, n) produces a 
matrix whose values have been reduced to the values 0, 1, …, n ? 1
%}
%% 
img = imread('_images/cameraman.bmp');

% image is 256 x 256
size(img)

qs = [256, 64, 32, 16, 8, 4, 2];
for i = 1:6
    subplot(3, 2, i), ...
        imshow(grayslice(img, qs(i)), gray(qs(i)))
end