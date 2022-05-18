clc; close all; clear;

A=imread('auto.jpg');
figure, imshow(A);
[szer,wys,k]=size(A);
n=szer*wys*.2;
piks_all=0;
piks=0;
p=0;
p2=szer*wys;

M=zeros(szer,wys);

R=zeros(szer,wys,3);
R=uint8(R);
R(:,:,1)=A(:,:,1);
G=zeros(szer,wys,3);
G=uint8(G);
G(:,:,2)=A(:,:,2);
B=zeros(szer,wys,3);
B=uint8(B);
B(:,:,3)=A(:,:,3);

tic;

for i=1:n
    l=floor(rand*szer)+1; 
    o=floor(rand*wys)+1;
    M(l,o)=1;

end

for i=1:1:szer
    for j=1:1:wys
        if(M(i,j)==0)
            R(i,j,1)=255;
            G(i,j,2)=255;
            B(i,j,3)=255;
        else
            piks_all=piks_all+1;
        end
    end
end
A2=zeros(szer,wys,3);
A2=uint8(A2);
A2(:,:,1)=R(:,:,1);
A2(:,:,2)=G(:,:,2);
A2(:,:,3)=B(:,:,3);
figure, imshow(A2);

G=rgb2gray(A2);
for i=1:1:szer
    for j=1:1:wys
        if (G(i,j)<252)
            piks=piks+1;
        end
        if (A(i,j)<252)
            p=p+1;
        end
    end
end
pole=piks/piks_all*100
poleA=p/p2*100
toc;
