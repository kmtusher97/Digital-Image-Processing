%%
%{
If the image signal is subject to a periodic, rather than a random 
disturbance, we might obtain an image corrupted by periodic noise. 
The effect is of bars over the image. Neither function imnoise or 
random_noise has a periodic option, but it is quite easy to create 
such noise, by adding a periodic matrix to the image.
%}
im = rgb2gray(imread('_images/moon.jpg'));

%% Add noise
[r, c] = size(im);
[x, y] = meshgrid(1:r, 1:c);
p = sin(x/3 + y/5) + 1;

n_im = (2*im2double(im) + p/2) / 3;

figure,
subplot(1, 2, 1), imshow(im);
subplot(1, 2, 2), imshow(n_im);

%% Recover Image
dft = fftshift(fft2(n_im));
dft_show = mat2gray(log(1 + abs(dft)));
dft1 = im2uint8(mat2gray(abs(dft)));

[row, col] = size(im);
dft1(row/2, col/2) = 0;
[i, j] = find(dft1 == max(dft1(:)));
X = (i-(row/2)).^2 + (j-(col/2)).^2;

%% Remove Noise with Band reject filtering

z = sqrt((x-(row/2)).^2 + (y-(col/2)).^2);
d = sqrt(X);
k = 45;
br = (z < floor(d - k) | z > ceil(d+k));

dft_br = dft.*br;
dft_inv = ifft2(dft_br);

r_im = n_im.*br;

figure, 
subplot(1, 3, 1), imshow(mat2gray(log(1 + abs(dft)))), ...
    title('DFT of the image');
subplot(1, 3, 2), imshow(mat2gray(log(1 + abs(dft_br)))), ...
    title('Band reject filtering on DFT');
subplot(1, 3, 3), imshow(mat2gray(abs(dft_inv))), ...
    title('After inversion');

%% Remove Noise with Criss­cross filtering

dft1 = dft;
dft1(i, :) = 0;
dft1(:, j) = 0;

z = sqrt((x-(row/2)).^2 + (y-(col/2)).^2);
d = sqrt(X);
k = 5;
br = (z < floor(d - k) | z > ceil(d+k));

dft_br = dft1.*br;
dft_inv = ifft2(dft_br);


figure, 
subplot(1, 3, 1), imshow(mat2gray(log(1 + abs(dft)))), ...
    title('DFT of the image');
subplot(1, 3, 2), imshow(mat2gray(log(1 + abs(dft_br)))), ...
    title('Criss­cross filtering on DFT');
subplot(1, 3, 3), imshow(mat2gray(abs(dft_inv))), ...
    title('After inversion');
