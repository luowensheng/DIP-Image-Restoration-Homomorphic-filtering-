<h1 align="center">Digital Image Processing: Image Restoration Homomorphic Filtering
</h1>
<p align="center">
    <a href="https://www.mathworks.com/products/matlab.html"><img src="https://img.shields.io/badge/MATLAB-blue.svg"></a>
    <a href="https://github.com/luowensheng/DIP-Image-Restoration-Homomorphic-filtering-/pulse"><img src="https://img.shields.io/badge/Maintained%3F-yes-green.svg"></a>
    <a href="https://github.com/luowensheng"><img src="https://badges.frapsoft.com/os/v2/open-source.svg?v=103"></a>

<p align="center">
  <a href="#Introduction">Introduction</a> •
  <a href="#Issues">Issues</a> •
  <a href="#Implementation">Implementation</a> •
  <a href="#Conclusion">Conclusion</a> •
  <a href="#Questions">Questions</a>
</p>

<br>

# Introduction
Implementation of *Image Restoration wiener filtering* to deblur the images, and *notch filter* to denoise the image and Homomorphic filtering

# Issues
### **Image Restoration**
- To use the wiener filtering and different parameters to deblur the images. 
- To observe the frequency spectrum, and design a notch filter to denoise the image.
- To observe the frequency spectrum, and design a band reject filter to denoise the image.
- To discuss the parameters chosen and any technique utilized.


### **Homomorphic Filtering**
* To apply following filters to enhance the image in Frequency domain. Then, recover these images from frequency domain to spatial domain.

1. Ideal highpass filter
2. Butterworth highpass filter
3. Gaussian highpass filter

* To discuss their characteristics.

# Implementation
### **Image Restoration**
- Wiener filtering to deblur the images:
    
    Image 1 and 2 and their **fourier transforms**:
    
    ![1](https://i.ibb.co/R6rm3kv/1.jpg)
    
    Our task is to analyze the frequency of these images and design a filter capable of restoring the image with wiener filter.

    <br>
    For the second image we have motion blur in both x and y axis. 

   ![2](https://i.ibb.co/XFY1LWY/2.jpg) 

   >Best result with **k=1/2**;

   <br>
   For the values of a, b, T, we have produced the best results for:

    ```
    a = 0.0155
    T = 0.5
    b = -0.0105
    ```
    ![3](https://i.ibb.co/9hJSd80/3.jpg) 


- Notch filter to denoise the image:

    ![4](https://i.ibb.co/fxJ8YFN/4.jpg)

- Band reject filter to denoise the image:

    ![5](https://i.ibb.co/stGhHtN/5.jpg)

    *After fourier:*

    ![6](https://i.ibb.co/6P5dfKx/6.jpg)

### **Homomorphic Filtering**

![7](https://i.ibb.co/jf7yxcL/7.jpg)

1. Ideal highpass filter:

![8](https://i.ibb.co/6RKD6ZG/8.jpg)

2. Butterworth highpass filter: 

![9](https://i.ibb.co/4fFLV1F/9.jpg)

3. Gaussian highpass filter: 

![10](https://i.ibb.co/g3TRRYK/10.jpg)


# Conclusion
Here are the noise in the frequency domain.
* Image 2 to image 4 are **raileigh**;
* Image 5 is **gamma**.

    ![11](https://i.ibb.co/64PWzPY/11.jpg)

# Reference
[1] [IEEE Manuscript Templates](http://www.ieee.org/conferences_events/conferences/publishing/templates.html).

# Questions
Submit your questions and bug reports [here](https://github.com/luowensheng/Natural-Language-Processing-Grammatical-Error-Correction-/issues).

