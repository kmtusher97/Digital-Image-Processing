im = rgb2gray(imread('_images/birds.jpg'));

%% Single Thresholding
figure,
subplot(1, 2, 1), imshow(im);
subplot(1, 2, 2), imshow(im < 50);

%% Double Thresholding
figure,
subplot(1, 2, 1), imshow(im);
subplot(1, 2, 2), imshow(im < 50 & im > 25);

%% Threshold Value
im1 = im2bw(im, 0.25);
im2 = im2bw(im, 0.45);

figure,
subplot(1, 2, 1), imshow(im1);
subplot(1, 2, 2), imshow(im2);

