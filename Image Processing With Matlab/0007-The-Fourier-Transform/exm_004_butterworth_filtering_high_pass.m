%%  Obtain an image and its DFT
im = imread('_image/cat.jpg');
dft = fftshift(fft2(im));
dft_show = mat2gray(log(1 + abs(dft)));

figure, 
subplot(1, 2, 1), imshow(im);
subplot(1, 2, 2), imshow(dft_show), ...
    title('DFT of the image');

%% Create Mesh Grid
[row, col] = size(im);
row = row / 2;
col = col / 2;
[x, y] = meshgrid(-col:col-1, -row:row-1);

%% Apply Butterworth Filter
D = 2; % Cut Off

% Butterworth High Pass Filter
bh = 1 - 1./(1 + ((x.^2 + y.^2)/D).^2);

dft_bh = dft.*bh;
dft_inv = ifft2(dft_bh);

figure, 
subplot(1, 3, 1), imshow(mat2gray(log(1 + abs(dft)))), ...
    title('DFT of the image');
subplot(1, 3, 2), imshow(mat2gray(log(1 + abs(dft_bh)))), ...
    title('Butterworth High Pass Filter on DFT');
subplot(1, 3, 3), imshow(mat2gray(abs(dft_inv))), ...
    title('After inversion');