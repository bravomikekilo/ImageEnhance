I = imread('a.png');
I = rgb2gray(I);
subplot(1,3,1);imshow(I);
t = fft2(I);
t = fftshift(t);
subplot(1,3,2);imshow(t);
t= ifft2(t);
subplot(1,3,3);imshow(uint8(t))