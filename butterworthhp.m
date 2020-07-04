

clear all
clc
%a=imresize(im2double(rgb2gray((imread('cameraman.jpg')))),0.67);
a=(im2double(imresize(imread('5.jpg'),0.67)));
af=fftshift(fft2(a));







hlp=butterhp(a,15,1);
aflp= af.*hlp;
aflpi=ifft2(aflp);
ifftshow(aflpi);







function []= fftshow(f)
f1=log(1+abs(f));
fm=max(f1(:));
figure,imshow(im2uint8(f1/fm));

end

function []=ifftshow(f)
f1=abs(f);
fm=max(f1(:));
figure, imshow(f1/fm);
end

function [out]=butterhp(im, d,n)
 
 h= size(im,1);
 w= size(im,2);
[x y]= meshgrid(-floor(w/2): floor(w-1)/2, -floor(h/2):floor(h-1)/2);
out=1./(1.+(d./(x.^2+y.^2).^0.5).^(2*n));

end





