function [ image ] = histbalance( img )

[m,n]=size(img);

imhist(img);
[count,x]=imhist(img);

image=img;

p = count/(m*n);
c = cumsum(p);

for i=1:256
    ordinalnum=find(img==i);
    totalnum=length(ordinalnum);
    for j=1:totalnum
        image(ordinalnum(j))=round(c(i)*256-1);
    end
end

end

