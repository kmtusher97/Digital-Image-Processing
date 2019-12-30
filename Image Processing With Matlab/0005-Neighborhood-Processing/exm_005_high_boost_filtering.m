im = imread('_image/apple.jpeg');

%%
f = [-1 -1 -1; -1 11 -1; -1 -1 -1] / 9;
im1 = imfilter(im, f);

figure,
subplot(1, 2, 1), imshow(im);
subplot(1, 2, 2), imshow(im1);

%% Using average filter
I = [0 0 0; 0 1 0; 0 0 0];
f = fspecial('average');
hbf = 3*I - 2*f;

im1 = imfilter(im, hbf);

figure,
subplot(1, 2, 1), imshow(im);
subplot(1, 2, 2), imshow(im1);