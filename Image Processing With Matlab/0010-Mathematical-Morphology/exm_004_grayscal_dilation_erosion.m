%% Dilation
t = imread('_images/caribou.jpg');

sq = ones(17, 17);
td = imdilate(t, sq);

figure,
subplot(1, 2, 1), imshow(td);

%% Erosion

sq = ones(4, 4);
td = imerode(t, sq);

subplot(1, 2, 2), imshow(td);