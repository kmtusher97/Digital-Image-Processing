%{
To apply histogram equalization in MATLAB or Octave, 
use the histeq function
%}
im = imread('_images/sea.jpg');
he_im = histeq(im);
%%
figure,
subplot(1, 2, 1), imshow(im);
subplot(1, 2, 2), imhist(im), axis tight;
%%
figure,
subplot(1, 2, 1), imshow(he_im);
subplot(1, 2, 2), imhist(he_im), axis tight;