p = rgb2gray(imread('_images/param.jpg'));
[r, c] = size(p);
[y, x] = meshgrid(linspace(0, 1, c), linspace(0, 1, r));
p2 = 1-im2double(p)+y/2;

figure,
subplot(1, 2, 1), imshow(p);
subplot(1, 2, 2), imshow(p2);