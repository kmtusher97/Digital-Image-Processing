im = imread('_images/rose.jpg');
im1 = zeros(size(im));
for i = 1:3
   im1(:, :, i) = histeq(im(:, :, i)); 
end

%im1 = cat(3, im1(:, :, 1), im1(:, :, 2), im1(:, :, 3));

figure,
subplot(1, 2, 1), imshow(im);
subplot(1, 2, 2), imshow(im1);

figure,
subplot(1, 3, 1), imshow(im1(:, :, 1));
subplot(1, 3, 2), imshow(im1(:, :, 2));
subplot(1, 3, 3), imshow(im1(:, :, 3));