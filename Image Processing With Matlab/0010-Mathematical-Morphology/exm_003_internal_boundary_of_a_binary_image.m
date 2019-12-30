p = rgb2gray(imread('_images/param.jpg'));
p1 = ~((p > 15) & (p < 180));
sq = ones(3, 3);
p2 = imerode(p1, sq);
p3 = p1-p2;

figure,
subplot(1, 2, 1), imshow(p1);
subplot(1, 2, 2), imshow(p3);