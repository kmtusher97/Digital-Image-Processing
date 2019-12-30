%%
%{
    imfilter(image, filter, ...)

1. ‘symmetric’    Filtering with reflection
2. ‘circular’     Filtering with tiling repetition
3. ‘replication’  Filtering by repeating the border elements
4. ‘full’         Padding with zero, and applying the filter 
                  at all places on and around the image where
                  the mask intersects the image matrix.

    fspecial('', [])
%}
im = imread('_image/cameraman.bmp');

%%
f1 = fspecial('average', [3,3]);
f2 = imfilter(im, f1);

figure,
subplot(1, 3, 1), imshow(im);
subplot(1, 3, 2), imshow(f1);
subplot(1, 3, 3), imshow(f2);

%%

f1 = fspecial('average', [15,15]);
f2 = imfilter(im, f1);

figure,
subplot(1, 3, 1), imshow(im);
subplot(1, 3, 2), imshow(f1);
subplot(1, 3, 3), imshow(f2);
