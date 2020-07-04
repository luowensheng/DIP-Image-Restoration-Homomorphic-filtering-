
%gaussian hp

clc 
clear all 
I1=imresize(imread('5.jpg'),0.67); 
 
f=double(I1);    
g=fft2(f);         
g=fftshift(g);  
[M,N]=size(g);  
d0=20;   
m=fix(M/2);  
n=fix(N/2);  
for i=1:M          
    for j=1:N              
       d=sqrt((i-m)^2+(j-n)^2);   
       h=exp(-(d.^2)./(2*(d0^2)));   % gaussian filter transform             
       result(i,j)=(1-h)*g(i,j);     %1-    
       end  
end   
result=ifftshift(result);  
J1=ifft2(result);  
figure(),imshow(I1);
J2=uint8(real(J1));  
figure(),imshow(J2);
fftshow(J2);
fftshow(I1);
figure, imhist(I1);

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
