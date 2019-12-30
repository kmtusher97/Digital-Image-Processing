im = imread('_images/flower.jpg');
eim = zeros(size(im));
for i = 1:3
    eim(:, :, i) = edge(im(:, :, i));
end

figure, imshow(eim);

r = eim(:, :, 1);
g = eim(:, :, 2);
b = eim(:, :, 3);

figure,
subplot(1, 3, 1), imshow(r);
subplot(1, 3, 2), imshow(g);
subplot(1, 3, 3), imshow(b);

im1 = cat(3, r, g, b);

figure, imshow(im1);
