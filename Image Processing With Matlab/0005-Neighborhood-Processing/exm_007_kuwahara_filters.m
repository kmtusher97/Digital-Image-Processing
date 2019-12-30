c = imread('_image/cameraman.bmp');

cd = double(c);
cdm = imfilter(cd, ones(3)/9, 'symmetric');
cd2f = imfilter(cd.^2, ones(3)/9, 'symmetric');
cdv = cd2f - cdm.^2;

%%

figure,
subplot(1, 2, 1), imshow(c);
subplot(1, 2, 2), imshow(mat2gray(cdv));