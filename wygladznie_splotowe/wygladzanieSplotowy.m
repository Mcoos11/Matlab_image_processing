clc; clear; close all;
A=imread('leopard-noise.jpg');
[szer,wys,kol]=size(A);
figure, imshow(A), title("oryginalny");

R=zeros(szer,wys,3);
R=uint8(R);
R(:,:,1)=A(:,:,1);
G=zeros(szer,wys,3);
G=uint8(G);
G(:,:,2)=A(:,:,2);
B=zeros(szer,wys,3);
B=uint8(B);
B(:,:,3)=A(:,:,3);

probkiKWDR=randi([1 3],1,7).*rand(1,7);
KWDR=sign(sin(probkiKWDR));
KWDR=KWDR'*KWDR;
KWDR=KWDR/sum(KWDR(:));

Rfilter=imfilter(R,KWDR);
Afilter(:,:,1)=Rfilter(:,:,1);
Gfilter=imfilter(G,KWDR);
Afilter(:,:,2)=Gfilter(:,:,2);
Bfilter=imfilter(B,KWDR);
Afilter(:,:,3)=Bfilter(:,:,3);
figure, imshow(Afilter), title("kwadratowa");

imwrite(Afilter, 'leopard_filtracja_kwdr.jpg')

probkiSINC=randi([1 floor(2*pi)],1,7).*rand(1,7);
SINC=sin(probkiSINC)./probkiSINC;
SINC=SINC'*SINC;
SINC=SINC/sum(SINC(:));

Rfilter=imfilter(R,SINC);
Afilter(:,:,1)=Rfilter(:,:,1);
Gfilter=imfilter(G,SINC);
Afilter(:,:,2)=Gfilter(:,:,2);
Bfilter=imfilter(B,SINC);
Afilter(:,:,3)=Bfilter(:,:,3);
figure, imshow(Afilter), title("sinc");

imwrite(Afilter, 'leopard_filtracja_sinc.jpg')


A=imread('leopard_filtracja_kwdr.jpg');
B=imread('leopard_filtracja_sinc.jpg');
C=imread('leopard-noise.jpg');

err1 = immse(A, C);
disp('Błąd filtru splotowego z funkcją jądra kwardatową');
disp(err1);
err2 = immse(A, B);
disp('Błąd filtru splotowego z funkcją jądra sinc');
disp(err2);
 