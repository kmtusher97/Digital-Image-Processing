c = imread('_images/caribou.jpg');

% store the bit plane images
max_bit = 8;
for i = 1 : max_bit
    subplot(2, 4, i), ...
        imshow(logical(bitget(c, i)));
end

%%
%{
** Recover the images
We can recover and display the 
original image by multiplying each 
bitplane by an appropriate power of
two and adding them
%}

recovered = zeros(size(c));
for i = 1 : max_bit
    recovered = recovered + 2 ^ (i - 1) * double(bitget(c, i));
end

% 'recovred' is the recovered image
figure, imshow(uint8(recovered));
isequal(c, uint8(recovered))
