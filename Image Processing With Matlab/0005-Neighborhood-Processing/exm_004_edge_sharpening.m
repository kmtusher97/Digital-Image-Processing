%% Sharping and Unsharping
im = imread('_image/cub.jpg');

%% Sharping
%Apply Low pass filter to make it blur
% make filter matrix
I = [0 0 0; 0 1 0; 0 0 0];
f = fspecial('average');
m = 3*I - 2*f;

% apply filter
im1 = imfilter(im, m);

figure,
subplot(1, 2, 1), imshow(im);
subplot(1, 2, 2), imshow(im1);

%% Unsharping
m = fspecial('unsharp', 0.5);
im2 = imfilter(im1, m);

figure,
subplot(1, 2, 1), imshow(im1);
subplot(1, 2, 2), imshow(im2);