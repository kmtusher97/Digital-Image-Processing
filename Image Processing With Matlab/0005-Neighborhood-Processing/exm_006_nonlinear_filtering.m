% NB: takes too much time to run
im = imread('_image/apple.jpeg');

im_max = nlfilter(im, [3, 3], 'max(x(:))');

figure,
subplot(1, 2, 1), imshow(im);
subplot(1, 2, 2), imshow(im_max);

%%
im_min = nlfilter(im, [3, 3], 'min(x(:))');

figure,
subplot(1, 2, 1), imshow(im);
subplot(1, 2, 2), imshow(im_min);

