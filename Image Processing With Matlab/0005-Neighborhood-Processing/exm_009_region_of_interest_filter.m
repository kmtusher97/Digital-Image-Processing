%%
im = rgb2gray(imread('_image/cub.jpg'));
%imshow(im), impixelinfo;

%% Make the polygon(region)
x = [342 200 201 254 415 507 535 397];
y = [161 234 365 492 492 394 263 174];

roi = roipoly(im, y, x);

%% Sharp the region
I = [0 0 0; 0 1 0; 0 0 0];
f = fspecial('average');
m = 3*I - 2*f;

im1 = roifilt2(m, im, roi);

figure,
subplot(1, 2, 1), imshow(im);
subplot(1, 2, 2), imshow(im1);
title('Sharping Region');

%% Unsharping the region
im1 = roifilt2(fspecial('unsharp'), im, roi);

figure,
subplot(1, 2, 1), imshow(im);
subplot(1, 2, 2), imshow(im1);
title('Unsharping Region');

%% Blur the region
im1 = roifilt2(fspecial('average', 15), im, roi);

figure,
subplot(1, 2, 1), imshow(im);
subplot(1, 2, 2), imshow(im1);
title('Blur Region');

%% Laplacian filter
im1 = roifilt2(fspecial('laplacian'), im, roi);

figure,
subplot(1, 2, 1), imshow(im);
subplot(1, 2, 2), imshow(im1);
title('Laplacian filter');

%% Gaussian filter
im1 = roifilt2(fspecial('gaussian', [5, 5], 40), im, roi);

figure,
subplot(1, 2, 1), imshow(im);
subplot(1, 2, 2), imshow(im1);
title('Gaussian filter');