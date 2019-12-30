%%  Obtain an image and its DFT
im = imread('_image/cat.jpg');
dft = fftshift(fft2(im));
dft_show = mat2gray(log(1 + abs(dft)));

figure, 
subplot(1, 2, 1), imshow(im);
subplot(1, 2, 2), imshow(dft_show), ...
    title('DFT of the image');

%% Recover the image from DFT

%size(c) must agree with original image's dimentions

% Low pass filtering
dft_high = dft .* create_mesh_grid_with_high_pass_filter(im); 
dft_inv = ifft2(dft_high);

show_result(dft, dft_high, dft_inv);

function [c] = create_mesh_grid_with_high_pass_filter(im)
    [row, col] = size(im);
    row = row / 2;
    col = col / 2;

    [x, y] = meshgrid(-col:col-1, -row:row-1);
    z = sqrt(x.^2 + y.^2);
    D = 5; %Cut off
    c = (z < D);
end

function [] = show_result(dft, dft_high, dft_inv)
    figure, 
    subplot(1, 3, 1), imshow(mat2gray(log(1 + abs(dft)))), ...
        title('DFT of the image');
    subplot(1, 3, 2), imshow(mat2gray(log(1 + abs(dft_high)))), ...
        title('Ideal filter on DFT');
    subplot(1, 3, 3), imshow(mat2gray(abs(dft_inv))), ...
        title('After inversion');
end