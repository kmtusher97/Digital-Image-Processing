t = rgb2gray(imread('_images/text2.png'));

sq = ones(7, 7);
td = imdilate(t, sq);

figure,
subplot(1, 2, 1), imshow(t);
subplot(1, 2, 2), imshow(td);