clear all
clc
i1=im2double(imresize(rgb2gray(imread('1.jpg')),0.67));
i2=im2double(imread('2.jpg'));
i3=im2double(imresize(imread('3.png'),0.5));
i4=im2double(imresize(imread('4.png'),0.5));
i5=im2double(imresize(imread('5.jpg'),0.67));



a1=fftshift(fft2(i1));
a2=fftshift(fft2(i2));
a3=fftshift(fft2(i3));
a4=fftshift(fft2(i4));
a5=fftshift(fft2(i5));

%fftshow(a1);

 subplot(1,2,1), fftshow(a1);
title('fft image 1');
subplot(1,2,2),imshow(i1);
title(' image 1 ');

figure, subplot(2,2,1), fftshow(a2);
title('fft image 2');
subplot(2,2,2),imshow(i2);
title(' image 2 ');



subplot(2,2,3), fftshow(a3);
title('fft image 3');
subplot(2,2,4), imshow(i3);
title(' image 3');


figure, subplot(2,2,1),fftshow(a4);
title('fft image 4');
subplot(2,2,2), imshow(i4);
title('image 4');


 subplot(2,2,3),fftshow(a5);
title('fft image 5');
subplot(2,2,4), imshow(i5);
title('image 5');



figure,subplot(2,2,1), imhist(ffts(a2));
title('image 2');
subplot(2,2,2), imhist(ffts(a3));
title('image 3');
subplot(2,2,3), imhist(ffts(a4));
title('image 4');
subplot(2,2,4), imhist(ffts(a5));
title('image 5');

function [out]= ffts(f)
f1=log(1+abs(f));
fm=max(f1(:));
out=(im2uint8(f1/fm));

end



function []= fftshow(f)
f1=log(1+abs(f));
fm=max(f1(:));
imshow(im2uint8(f1/fm));

end

function []=ifftshow(f)
f1=abs(f);
fm=max(f1(:));
imshow(f1/fm);
end



