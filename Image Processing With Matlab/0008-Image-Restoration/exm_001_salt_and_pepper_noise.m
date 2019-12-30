%%
%{
Also called impulse noise, shot noise, or binary noise. 
This degradation can be caused by sharp, sudden disturbances 
in the image signal; its appearance is randomly scattered 
white or black (or both) pixels over the image.
%}
im = rgb2gray(imread('_images/moon.jpg'));

%% Add noise
n_im = imnoise(im, 'salt & pepper');
%n_im = imnoise(im, 'salt & pepper', 0.02);

figure,
subplot(1, 2, 1), imshow(im);
subplot(1, 2, 2), imshow(n_im);



%% Remove Noise with average filter (color image)
%{
Given that pixels corrupted by salt and pepper noise are high frequency 
components of an image, we should expect a low pass filter should reduce 
them. So we might try filtering with an average filter
%}

r_im = imfilter(n_im, fspecial('average', 8));

figure,
subplot(1, 2, 1), imshow(n_im);
subplot(1, 2, 2), imshow(r_im), ...
    title('Remove Noise with average filter');

%% Remove Noise with median filter (only for gray image)

% r_im = medfilt2(n_im);
r_im = medfilt2(n_im, [5, 5]);

figure,
subplot(1, 2, 1), imshow(n_im);
subplot(1, 2, 2), imshow(r_im), ...
    title('Remove Noise with median filter');

%% Applying Median filter twice

r_im = medfilt2(medfilt2(n_im, [3, 3]), [5, 5]);

figure,
subplot(1, 2, 1), imshow(n_im);
subplot(1, 2, 2), imshow(r_im), ...
    title('Remove Noise with median filter twice');

%% Remove Noise using Rank order filter (gray image only);
% Best quality

r_im = ordfilt2(n_im, 5, ...
    [0 0 1 0 0; 0 0 1 0 0; 1 1 1 1 1; 0 0 1 0 0; 0 0 1 0 0]);

figure,
subplot(1, 2, 1), imshow(n_im);
subplot(1, 2, 2), imshow(r_im), ...
    title('Remove Noise using Rank order filter 5*5');

%% An Outlier Method 
%{
Applying the median filter can in general be a slow operation: each pixel 
requires the sorting of at least nine values.1 To overcome this difficulty, 
Pratt [35] has proposed the use of cleaning salt and pepper noise by 
treating noisy pixels as outliers; that is, pixels whose gray values are 
significantly different from those of their neighbors. This leads to the 
following approach for noise cleaning:

    1. Choose a threshold value D.
    2. For a given pixel, compare its value p with the mean m of the values 
       of its eight neighbors.
    3. If |p ? m| > D, then classify the pixel as noisy, otherwise not.
    4. If the pixel is noisy, replace its value with m; otherwise leave its 
       value unchanged.

%}

n_im1 = im2double(n_im);
m = [1 1 1; 1 0 1; 1 1 1]/8;
r_im = imfilter(n_im1, m);
D = 0.5;
r = abs(n_im1-r_im) > D;

figure,
subplot(1, 2, 1), imshow(n_im);
subplot(1, 2, 2), imshow(r.*r_im + (1-r).*n_im1), ...
    title('Remove Noise with an outlier method ');