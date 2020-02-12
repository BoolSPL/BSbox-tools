# BSbox-tools: Software for representation, deﬁning and computing the most important cryptographic properties of Boolean and Vector Boolean functions (S-boxes)

BSbox-tools is a tool for study cryptographic properties of Boolean and Vector Boolean functions (S-boxes).

#### Current release: v0.2

### Description

The problems related to representation, deﬁning and computing the most important cryptographic properties of Boolean and Vector Boolean functions (S-boxes) require effective algorithms. With the increasing amount of input data, the problem requires more computational resources. To compute some of the cryptographic properties (linearity, autocorrelation, algebraic degree, differential uniformity) very effective algorithms have to be realized. These algorithms are suitable for parallel implementation. 

### What is BSbox-tools?

BSbox-tools is developed software for representation, defining and computing the most important cryptographic properties of Boolean and Vector Boolean functions (S-boxes). For development of this software is use our CUDA oriented library BoolSPLG (Boolean S-box Properties Library for GPUs), a library with parallel algorithms for Boolean functions and S-boxes for GPU. To use this software there is no need knowledge of a programming language. BoolSPL (Boolean S-box parallel library for GPU) provides, reusable software components for every layer of the CUDA programming model [5]. BoolSPLG is a library consisting procedures for analysis and compute cryptographic properties of Boolean and Vector Boolean function (S-box). Our procedures have function for auto grid conﬁguration. Most of the functions are designed to compute the data in registers because they oﬀer the highest bandwidth. 

### Overview of BSbox-tools 

 BSbox-tools is specialized console application program for representation, deﬁning and computing the most important cryptographic properties of Boolean and Vector Boolean functions (S-boxes). With other words BSbox-tools represents a console interface program on the BoolSPL library. The version BSbox-tools_v0.2 is based on BoolSPL_v0.2 library version. This application combines CPU and GPU functionality.

On figure 1 is show main menu of BSbox-tools console interface program. How we can see it is given some information about the program as current version, minimal requires compute capability, notification if minimal requires are fulfilled. After initial information their info about input and output files and then follows menu with the options. 
