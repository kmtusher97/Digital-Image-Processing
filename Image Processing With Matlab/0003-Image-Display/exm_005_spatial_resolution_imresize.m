img = imread('_images/caribou.jpg');

% imresize(img, 1/2)
for i = 1:4
    subplot(2, 2, i), ...
        imshow(imresize(imresize(img, 1/(2^(i+1))), ...
            2^(i+1), 'nearest'))
end