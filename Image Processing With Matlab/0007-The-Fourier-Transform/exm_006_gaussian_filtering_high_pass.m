%%  Obtain an image and its DFT
im = imread('_image/apple.jpeg');
dft = fftshift(fft2(im));
dft_show = mat2gray(log(1 + abs(dft)));

figure, 
subplot(1, 2, 1), imshow(im);
subplot(1, 2, 2), imshow(dft_show), ...
    title('DFT of the image');


%% Apply Gaussian High Pass Filter
sigma = 70;
gh = 1 - mat2gray(fspecial('gaussian', size(im), sigma));

dft_gh = dft.*gh;
dft_inv = ifft2(dft_gh);

figure, 
subplot(1, 3, 1), imshow(mat2gray(log(1 + abs(dft)))), ...
    title('DFT of the image');
subplot(1, 3, 2), imshow(mat2gray(log(1 + abs(dft_gh)))), ...
    title('Gaussian High Pass Filter on DFT');
subplot(1, 3, 3), imshow(mat2gray(abs(dft_inv))), ...
    title('After inversion');