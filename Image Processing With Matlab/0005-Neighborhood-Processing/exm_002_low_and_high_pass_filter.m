%%
%{
high pass filter      if it “passes over” the high frequency components, 
                      and reduces or eliminates low frequency components

low pass filter       if it “passes over” the low frequency components, 
                      and reduces or eliminates high frequency components

%}
im = imread('_image/apple.jpeg');

%% laplacian fileter (high pass)
f = fspecial('laplacian');
fim = imfilter(im, f, 'symmetric');

figure,
subplot(1, 2, 1), imshow(im);
subplot(1, 2, 2), imshow(fim), title('laplacian');

%% log filter
f = fspecial('log');
fim = imfilter(im, f, 'symmetric');

figure,
subplot(1, 2, 1), imshow(im);
subplot(1, 2, 2), imshow(fim), title('log');

%% arbitrary 3 x 3 matrix
% filter matrix
f = [1 -2 1; -2 4 -2; 1 -2 1];
fim = imfilter(double(im), f);

figure,
subplot(1, 2, 1), imshow(im);
subplot(1, 2, 2), imshow(mat2gray(fim)), title('arbitrary 3 x 3 matrix');
