im = rgb2gray(imread('_images/moon1.jpg'));

%% Motion Blur
n = 17;
m = fspecial('motion', n);
im1 = imfilter(im, m);

figure,
subplot(1, 2, 1), imshow(im);
subplot(1, 2, 2), imshow(im1);

%% Motion Deblur
m2 = zeros(size(im));
m2(1, 1:n) = m;
dft = fft2(m2);
dft_inv = ifft2(fft2(im1)./dft);

figure, imshow(mat2gray(abs(dft_inv)));
