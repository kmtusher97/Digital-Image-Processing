b = imread('_images/blocks.png');

subplot(1, 2, 1), imshow(b + 128);
subplot(1, 2, 2), imshow(b - 128);