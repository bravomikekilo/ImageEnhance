clear all;
pic=imread('origin.jpg'); %��ȡ�ļ�
pic=rgb2gray(pic);  %��Ϊ�ڰ�
f=double(pic);  %unit8��Ϊ˫������ֵ
[m,n]=size(f); 
ker=1/441*ones(21,21);
g=ordfilt2(f,441,ones(21,21));
g=conv2(g,ker,'same');
g=f-g;
g=g-min(min(g));
figure(1);imshow(g,[0,255]); %�������ղ������ͼ��

%g=255-g; %�ڰ׵ߵ�
z=log(g+1);  %ȡ������+1��Ϊ�˷�ֹ����-inf
Z=fft2(z);  %��ά���ٸ���Ҷ�任
hh=1.5;
hl=0.5;
d0=0.1; %̬ͬ�˲����Ĳ����ɵ�
D=zeros(m,n);
for i=1:m
    for j=1:n
        D(i,j)=(i-m/2)^2+(j-n/2^2); %����Ƶ����뺯��
    end
end
Hhigh=zeros(m,n);
for i=1:m
    for j=1:n
        Hhigh(i,j)=1/(1+(d0^2/D(i,j))^2); %������װ�����˹��ͨ�˲�ת�ƺ���   
    end
end
Hhomo=(hh-hl)*Hhigh+hl; %����̬ͬ�˲�ת�ƺ���
S=zeros(m,n);
for i=1:m
    for j=1:n
        S(i,j)=Hhomo(i,j)*Z(i,j); %�����˲�
    end
end
s=ifft2(S); %���˲���ĺ������з��任
r=exp(real(s))-1; %��ǿ���ͼ�����
final=255*2/max(max(r))*r; %ת��Ϊ0~255�ĻҶ�ͼ��
%final=255-final; %�ڰ׵ߵ�
figure(2);imshow(final,[0,255]); %��ԭΪ�Ҷ�ͼ��
