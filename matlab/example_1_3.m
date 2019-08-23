B = rand(256).*1000;
imshow(B);

imagesc(B);
axis image;
axis off;
colormap(gray);
colorbar;

imshow(B, [0 1000]);