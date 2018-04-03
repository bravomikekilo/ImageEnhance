I = imread('../origin.jpg');
I = rgb2gray(I);
%I = histbalance(I);
I = I(100:200,200:800);
subplot(121);imshow(I);
t =double(I);  
t = fft2(t);
t = fftshift(t);

thp = t .* highpassBW(t,0.1,2) ;
tlp = t .* lowpassBW(t,1,2) ;
%subplot(1,5,5);
s = ifft2(I);

subplot(122);imshow(real(s),[]);

