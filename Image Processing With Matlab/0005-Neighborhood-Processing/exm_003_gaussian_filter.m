%%
%{
The command fspecial('gaussian') produces a discrete version of this 
function. We can draw pictures of this with the surf function, and to 
ensure a nice smooth result, we shall create a large filter (size 50 × 50) 
with different standard deviations.
%}
im = imread('_image/apple.jpeg');
a = 50;

%%
s = 3;
g = fspecial('gaussian', [a, a], s);
figure, surf(1:a, 1:a, g);

%%
s = 9;
g1 = fspecial('gaussian', [a, a], s);
figure, surf(1:a, 1:a, g1);

%%
figure, imshow(imfilter(im, g));

%%
figure, imshow(imfilter(im, g1));

%%
figure, imshow(imfilter(im, fspecial('gaussian', [15, 15], 30)));

