t = rgb2gray(imread('_images/text2.png'));

sq = ones(4, 4);
td = imerode(t, sq);

figure,
subplot(1, 2, 1), imshow(t);
subplot(1, 2, 2), imshow(td);