%%  Obtain an image and its DFT
im = imread('_image/cat.jpg');
dft = fftshift(fft2(im));
dft_show = mat2gray(log(1 + abs(dft)));

figure, 
subplot(1, 2, 1), imshow(im);
subplot(1, 2, 2), imshow(dft_show), ...
    title('DFT of the image');

%% Recover the image from DFT
% create mesh grid
[row, col] = size(im);
row = row / 2;
col = col / 2;

[x, y] = meshgrid(-col:col-1, -row:row-1);
z = sqrt(x.^2 + y.^2);
D = 55; %Cut off
c = (z < D);

%size(c) must agree with original image's dimentions

% Low pass filtering
dft_low = dft.*c; 
dft_inv = ifft2(dft_low);

figure, 
subplot(1, 3, 1), imshow(mat2gray(log(1 + abs(dft)))), ...
    title('DFT of the image');
subplot(1, 3, 2), imshow(mat2gray(log(1 + abs(dft_low)))), ...
    title('Ideal filter on DFT');
subplot(1, 3, 3), imshow(mat2gray(abs(dft_inv))), ...
    title('After inversion');