clear all;
pic=imread('origin.jpg'); %读取文件
pic=rgb2gray(pic);  %变为黑白
f=double(pic);  %unit8变为双精度数值
[m,n]=size(f); 
ker=1/441*ones(21,21);
g=ordfilt2(f,441,ones(21,21));
g=conv2(g,ker,'same');
g=f-g;
g=g-min(min(g));
figure(1);imshow(g,[0,255]); %消除光照不均后的图像

%g=255-g; %黑白颠倒
z=log(g+1);  %取对数，+1是为了防止出现-inf
Z=fft2(z);  %二维快速傅里叶变换
hh=1.5;
hl=0.5;
d0=0.1; %同态滤波器的参数可调
D=zeros(m,n);
for i=1:m
    for j=1:n
        D(i,j)=(i-m/2)^2+(j-n/2^2); %构造频域距离函数
    end
end
Hhigh=zeros(m,n);
for i=1:m
    for j=1:n
        Hhigh(i,j)=1/(1+(d0^2/D(i,j))^2); %构造二阶巴特沃斯高通滤波转移函数   
    end
end
Hhomo=(hh-hl)*Hhigh+hl; %构造同态滤波转移函数
S=zeros(m,n);
for i=1:m
    for j=1:n
        S(i,j)=Hhomo(i,j)*Z(i,j); %进行滤波
    end
end
s=ifft2(S); %对滤波后的函数进行反变换
r=exp(real(s))-1; %增强后的图像矩阵
final=255*2/max(max(r))*r; %转化为0~255的灰度图像
%final=255-final; %黑白颠倒
figure(2);imshow(final,[0,255]); %还原为灰度图像
