 
im = imread('_image/cat.jpg');
imd = im2double(im);

%% Create Mesh Grid
[row, col] = size(im);
row = row / 2;
col = col / 2;
[x, y] = meshgrid(-col:col-1, -row:row-1);

%% Apply Homomorphic Filtering
D = 16;
imdx = imd.*(0.5+0.4*sin((1.3*x+0.7*y-50)/D));

figure, 
subplot(1, 2, 1), imshow(im);
subplot(1, 2, 2), imshow(imdx), ...
    title('Homomorphic Filter');
