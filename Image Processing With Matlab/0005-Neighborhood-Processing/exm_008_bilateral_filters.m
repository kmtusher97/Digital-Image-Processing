c = imread('_image/cameraman.bmp');

%%
patch = imcrop(c, [170, 35, 50, 50]);
figure, imshow(patch);

%%
patchVar = std2(patch)^2;

%%
DoS = 2*patchVar;
cb = imbilatfilt(c, DoS);

figure,
subplot(1, 2, 1), imshow(c);
subplot(1, 2, 2), imshow(cb);