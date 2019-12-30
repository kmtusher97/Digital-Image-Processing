%%
%{
Point operations can be performed very effectively by the 
use of a lookup table, known more simply as an LUT. For 
operating on images of type uint8, such a table consists 
of a single array of 256 values, each value of which is an 
integer in the range 0 … 255. Then our operation can be 
implemented by replacing each pixel value p by the corresponding 
value t in the table.

take an n * n image. T = (0:n-1)
%}
im = imread('_images/blocks.png');
%%
% make LUT
T = uint8(floor(0:750)/2);
im1 = T(im);

figure,
subplot(1, 2, 1), imshow(im);
subplot(1, 2, 2), imshow(im1);
%%
T = uint8(floor(0:750)/5);
im1 = T(im);

figure,
subplot(1, 2, 1), imshow(im);
subplot(1, 2, 2), imshow(im1);