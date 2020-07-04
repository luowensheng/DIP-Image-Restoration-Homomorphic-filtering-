
clear all
clc

a=rgb2gray(imresize(im2double(imread('1.jpg')),0.67));
i2=im2double(imread('2.jpg'));

F1=WIENER(a, 2);
F1=ifft2(F1);
ifftshow(F1);


F2=WIENER(i2, 2);
F2=ifft2(F2);
ifftshow(F2);



function []= fftshow(f)
f=fftshift(fft2(f));
f1=log(1+abs(f));
fm=max(f1(:));
figure,imshow(im2uint8(f1/fm));

end
function [out]= ffts(f)
f1=log(1+abs(f));
fm=max(f1(:));
out=(im2uint8(f1/fm));

end

function []=ifftshow(f)
f1=abs(f);
fm=max(f1(:));
figure, imshow(f1/fm);
end

function [F1]=WIENER(im,k)
im=fftshift(fft2(im));

a=0.0155;
b=-0.0105;
T=0.5;

%Create the H(u,v)function
M= size(im,1);
N= size(im,2);
[U V]= meshgrid(-floor(N/2): floor(N-1)/2, -floor(M/2):floor(M-1)/2);
H1=exp(-0.00025.*(U.^2 + V.^2)).^(5/6);
%w= pi.*((u.*a)+(v.*b)) ;
%w1=sin(w);
%w2=-(sqrt(-1).*(w));
%w2=exp(w2);
%w3=T./w;
%H1=w3.*w1.*w2;
%imshow(H1);
F1=im.*(1./H1).*(abs(H1)./(abs(H1)+(1/k)));
F1=ifft2(ifftshift(F1));
ifftshow(F1);

end



