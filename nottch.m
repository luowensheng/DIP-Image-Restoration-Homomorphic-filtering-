
%Notch_Filter 
 
clear all 
clc 
 
source_pic=imresize(imread('4.png'),0.50);
pic=source_pic;
 
noise_pic=source_pic; 
 
 
[M,N]=size(pic); 
u0=M/2; 
v0=0; 
for u=1:M 
    for v=1:N 
        D1(u,v)=sqrt((u-M/2-u0)^2+(v-N/2-v0)^2); 
        D2(u,v)=sqrt((u-M/2+u0)^2+(v-N/2+v0)^2); 
    end 
end 
 
%D0=M/2/(2*pi); 
  
D0=20; 
 

 
for u=1:M 
    for v=1:N 
        if (D1(u,v)<=D0 || D2(u,v)<=D0) 
            Hnr(u,v)=0; 
        else 
            Hnr(u,v)=1; 
        end 
    end 
end 
             
 
% apply H to noise_pic 
for x=1:M 
    for y=1:N 
        noise_pic(x,y)=(-1)^(x+y)*noise_pic(x,y); 
    end 
end 
 
noise=fft2(noise_pic); 
 
image=Hnr.*noise; 
 
image=ifft2(image); 
 
for x=1:M 
    for y=1:N 
        image(x,y)=image(x,y)/(-1)^(x+y); 
        noise_pic(x,y)=noise_pic(x,y)/(-1)^(x+y); 
    end 
end 
 


 
%imwrite(image,'image.bmp'); 

figure, ifftshow(image); 
 
 
% Calculate noise 
for x=1:M 
    for y=1:N 
        H_temp(x,y)=(-1)^(x+y)*Hnr(x,y); 
    end 
end 
 


H_spectrum=log10(abs(fft2(H_temp))+1); 
H_spectrum=255*(H_spectrum-min(min(H_spectrum)))/(max(max(H_spectrum))-min(min(H_spectrum))); 
 
figure,imshow(uint8(H_spectrum)); 

function []=ifftshow(f)
f1=abs(f);
fm=max(f1(:));
 imshow(f1/fm);
end
