im = rgb2gray(imread('_images/moon1.jpg'));
dft = fftshift(fft2(im));

figure,
subplot(1, 3, 1), imshow(im);

%% Mesh Grid
[r, c] = size(im);
[x, y] = meshgrid(-c/2:c/2-1, -r/2:r/2-1);

%% Butterworth Filtering
D = 15;
br = 1./(1+(sqrt(2) - 1)*((x.^2+y.^2)/D^2).^2);
dft_bw = dft.*br;
dft_inv = ifft2(dft_bw);

blur = im2uint8(mat2gray(abs(dft_inv)));
subplot(1, 3, 2), imshow(blur), title('Butterwort filtering');


%% Inverse Filtering

blr_dft = fftshift(fft2(blur));
D = 40;
br1 = 1./(1+(sqrt(2) - 1)*((x.^2+y.^2)/D^2).^10);
blr_dft_br = blr_dft./br.*br1;
blr_dft_inv = ifft2(blr_dft_br);

subplot(1, 3, 3), imshow(mat2gray(abs(blr_dft_inv))), ...
    title('Inverse filtering');