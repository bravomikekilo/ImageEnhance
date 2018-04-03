clear;
I=imread('../origin.jpg');
I=rgb2gray(I);
sobelBW=edge(I,'sobel',0.018);
figure;
imshow(sobelBW);
title('Sobel Edge');
sobel1=I-im2uint8(sobelBW);
figure;
imshow(sobel1);
robertsBW=edge(I,'roberts',0.018);
figure;
imshow(robertsBW);
title('Roberts Edge');
robertsBW1=I-im2uint8(robertsBW);
figure;
imshow(robertsBW1);
prewittBW=edge(I,'prewitt',0.019);
figure;
imshow(prewittBW);
title('Prewitt Edge');
prewittBW1=I-im2uint8(prewittBW);
figure;
imshow(prewittBW1);
cannyBW=edge(I,'canny',0.25);
figure;
imshow(cannyBW);
title('Canny Edge');
cannyBW1=I-im2uint8(cannyBW);
figure;
imshow(cannyBW1);
