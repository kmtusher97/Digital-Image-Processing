c = imread('_images/caribou.jpg');

% we take the caribou matrix and 
% create a new matrix with 

c_bin = c > 120;
figure, imshow(c_bin);

% remove the logical flag from c_bin
c_uint8 = uint8(c_bin);
figure, imshow(c_uint8);

% get back to a viewable image
% we can either turn the logical flag back on
figure, imshow(logical(c_uint8)), title('By logical() funtion');

% or simply convert to type double
figure, imshow(double(c_uint8)), title('By double() funtion');