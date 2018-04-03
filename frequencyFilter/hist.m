I = imread('../origin.jpg');
I = rgb2gray(I);

I1=histbalance(I);

subplot(1,2,1);imshow(I);
subplot(1,2,2);imshow(I1);


