clc; close all; clear;

A=imread('nazwa.bmp');
[szer, wys, kol]=size(A);
figure(1);
imshow(A);
title("Oryginalny obraz");

R=zeros(szer,wys,3);
R=uint8(R);
Rinterp=zeros(szer,wys,3);
Rinterp=uint8(Rinterp);
G=zeros(szer,wys,3);
G=uint8(G);
Ginterp=zeros(szer,wys,3);
Ginterp=uint8(Ginterp);
B=zeros(szer,wys,3);
B=uint8(B);
Binterp=zeros(szer,wys,3);
Binterp=uint8(Binterp);

R(: , : , 1)=A(: , : ,1);
Rinterp(: , : , 1)=A(: , : ,1);
for i=1:szer
    for j=1:wys
        if(mod(j,2)==0)
            R(i, j, 1)=0;
            %Rinterp(i, j, 1)=()
        elseif (mod(j,2)==1)
            if(mod(i,2)==1)
                R(i, j, 1)=0;
            end
        end
    end
end
figure(2);
imshow(R);
title("Część R po przefiltrowaniu filtrem Bayera");

G(: , : , 2)=A(: , : ,2);
Ginterep(: , : , 2)=A(: , : ,2);
for i=1:szer
    for j=1:wys
        if(mod(j,2)==0)
            if(mod(i,2)==1)
                G(i, j, 2)=0;
            end
        elseif (mod(j,2)==1)
            if(mod(i,2)==0)
                G(i, j, 2)=0;
            end
        end
    end
end
figure(3);
imshow(G);
title("Część G po przefiltrowaniu filtrem Bayera");

B(: , : , 3)=A(: , : ,3);
Binterp(: , : , 3)=A(: , : ,3);
for i=1:szer
    for j=1:wys
        if(mod(j,2)==0)
            if(mod(i,2)==0)
                B(i, j, 3)=0;
            end
        elseif (mod(j,2)==1)
            B(i, j, 3)=0;
        end
    end
end
figure(4);
imshow(B);
title("Część B po przefiltrowaniu filtrem Bayera");

Abayes=zeros(szer,wys,3);
Abayes=uint8(Abayes);
Abayes(: , : , 1)=R(: , : , 1);
Abayes(: , : , 2)=G(: , : , 2);
Abayes(: , : , 3)=B(: , : , 3);
figure(5);
imshow(Abayes);
title("Obraz po przefiltrowaniu filtrem Bayera");
    