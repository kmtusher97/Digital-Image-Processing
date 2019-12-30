%% 
%{
Whereas Gaussian noise can be modeled by random values added to an image; 
speckle noise (or more simply just speckle) can be modeled by random 
values multiplied by pixel values, hence it is also called multiplicative 
noise. Speckle noise is a major problem in some radar applications.
%}

im = imread('_images/monalisa.jpg');
%% Add noise
n_im = imnoise(im, 'speckle');

figure,
subplot(1, 2, 1), imshow(im);
subplot(1, 2, 2), imshow(n_im);

%% Remove Noise
