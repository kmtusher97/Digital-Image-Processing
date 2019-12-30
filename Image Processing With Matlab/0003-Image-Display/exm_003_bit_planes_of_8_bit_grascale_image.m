c = imread('_images/caribou.jpg');

% bit planes can be accessed by the bitget function
% n-th rightmost bit from every element in c
max_bit = 8;
for n = 1 : max_bit
    subplot(2, 4, n), ...
        imshow(logical(bitget(c, n)));
end