%%
%{
Gaussian noise is an idealized form of white noise, which is caused by 
random fluctuations in the signal. We can observe white noise by watching 
a television that is slightly mistuned to a particular channel. Gaussian 
noise is white noise which is normally distributed. If the image is 
represented as I, and the Gaussian noise by N, then we can model a noisy 
image by simply adding the two: 
                I + N
%}

im = rgb2gray(imread('_images/moon.jpg'));

%% Add noise
n_im = imnoise(im, 'gaussian');

figure,
subplot(1, 2, 1), imshow(im);
subplot(1, 2, 2), imshow(n_im);

%% Remove Noise with Image averaging
n = 100;
tmp = zeros([size(im), n]);
for i = 1:n
    tmp(:, :, i) = imnoise(im, 'gaussian');
end

tmp_avg = mean(tmp, 3);
r_im = mat2gray(abs(tmp_avg));

figure,
subplot(1, 2, 1), imshow(n_im);
subplot(1, 2, 2), imshow(r_im), ...
    title('Remove Noise with Image averaging');

%% Remove Noise with average filter
r_im = imfilter(n_im, fspecial('average', 8));

figure,
subplot(1, 2, 1), imshow(n_im);
subplot(1, 2, 2), imshow(r_im), ...
    title('Remove Noise with average filter');

%% Removing Noise with Adaptive Filter
r_im = wiener2(n_im, [5, 5]);

figure,
subplot(1, 2, 1), imshow(n_im);
subplot(1, 2, 2), imshow(r_im), ...
    title('Removing Noise with Adaptive Filter');