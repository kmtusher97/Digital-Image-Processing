%%
%{
To perform histogram stretching in MATLAB or Octave 
the imadjust function may be used.
 imadjust(im, [a, b], [c, d], gamma)
%}
%%

im = imread('_images/sea.jpg');
figure, imshow(im);

%%
% adjust with Gamma value

im1 = imadjust(im, [], [], 0.5);
im2 = imadjust(im, [], [], 0.25);

figure,
subplot(1, 2, 1), imshow(im1), title('Gamma = 0.5');
subplot(1, 2, 2), imshow(im2), title('Gamma = 0.25');

%%
%{
The imadjust stretching function can be 
viewed with the plot function
%}
figure, plot(im, im1, '.'), axis tight;
