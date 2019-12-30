%{
MATLAB and Octave can display a grayscale image with imshow if the image matrix x is of type uint8, or
of type double with all values in the range 0.0 – 1.0. They can also display images of type uint16, but for
Octave this requires that the underlying ImageMagick library is compiled to
handle 16-bit images. Then will display x as an image.

This means that any image processing that produces an output of type double must either be scaled to
the appropriate range or converted to type uint8 before display.
%}

c = imread('_images/caribou.jpg');
cd = double(c);
figure, imshow(c), figure, imshow(cd);


figure, imshow(cd/255), title('cd/255');
figure, imshow(cd/512), title('cd/512');
figure, imshow(cd/128), title('cd/128');