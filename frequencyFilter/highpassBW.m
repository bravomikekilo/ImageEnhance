function [ w ] = highpassBW( img,d0,nn )

[M,N] = size(img);
w = zeros(size(img));

m=floor(M/2); n=floor(N/2);  

for i=1:M  
       for j=1:N  
           d=sqrt((i-m)^2+(j-n)^2);  
           w(i,j) = 1/(1 + ((d0/d)^2*nn)) ; %   1/1+(D0/D)^n
       end  
end


end

