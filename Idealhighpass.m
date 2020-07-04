
%ideal high pass



I=imresize(imread('5.jpg'),0.67); 

g=fft2(I);         
g=fftshift(g);    
[M,N]=size(g);   
m=fix(M/2); n=fix(N/2); 
d0=20;        
 

for i=1:M 
       for j=1:N 
           d=sqrt((i-m)^2+(j-n)^2); 
           if(d<d0) h1=0; 
           else h1=1; 
           end 
           G1(i,j)=h1*g(i,j);
       end 
end 
G1=ifftshift(G1); 
I2_1=ifft2(G1);   
I3_1=uint8(real(I2_1));
figure, imshow(I3_1);
 