clear all; 
clc; 
image=imresize(imread('3.png'),0.5); 

figure, imshow(image); 
%title(); 
FftData=fftshift(fft2(image));

[row,column]=size(FftData); 
x0=round(column/2); 
y0=round(row/2); 
n=2;                  
D0=175;               
W=125;               
for i=1:row                                
    for j=1:column 
        distance=sqrt((i-x0)^2+(j-y0)^2); 
        h=1/(1+(distance*W/(distance^2-D0^2))^(2*n)); 
        FftData(i,j)=h*FftData(i,j); 
   end 
end 

 
 
IfftData=ifft2(FftData); 
subplot(2,2,3); 
figure,ifftshow(IfftData); 
%title('');

function []=ifftshow(f)
f1=abs(f);
fm=max(f1(:));
 imshow(f1/fm);
end
