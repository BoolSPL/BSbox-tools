# BSbox-tools: Software for study Boolean and Vector Boolean functions (S-boxes)

BSbox-tools is open source tool for representation, defining and computing the most important cryptographic properties of Boolean and Vector Boolean functions (S-boxes).

#### Current release: v0.2

### Description

The problems related to representation, deﬁning and computing the most important cryptographic properties of Boolean and Vector Boolean functions (S-boxes) require effective algorithms. With the increasing amount of input data, the problem requires more computational resources. To compute some of the cryptographic properties (linearity, autocorrelation, algebraic degree, differential uniformity) very effective algorithms have to be realized. These algorithms are suitable for parallel implementation. 

### What is BSbox-tools?

BSbox-tools is developed software for representation, defining and computing the most important cryptographic properties of Boolean and Vector Boolean functions (S-boxes). For development of this software is use our CUDA oriented library BoolSPLG (Boolean S-box Properties Library for GPUs), a library with parallel algorithms for Boolean functions and S-boxes for GPU. To use this software there is no need knowledge of a programming language. BoolSPL (Boolean S-box parallel library for GPU) provides, reusable software components for every layer of the CUDA programming model [5]. BoolSPLG is a library consisting procedures for analysis and compute cryptographic properties of Boolean and Vector Boolean function (S-box). Our procedures have function for auto grid conﬁguration. Most of the functions are designed to compute the data in registers because they oﬀer the highest bandwidth. 

### Overview of BSbox-tools 

 BSbox-tools is specialized console application program for representation, deﬁning and computing the most important cryptographic properties of Boolean and Vector Boolean functions (S-boxes). With other words BSbox-tools represents a console interface program on the BoolSPL library. The version BSbox-tools_v0.2 is based on BoolSPL_v0.2 library version. This application combines CPU and GPU functionality.

On figure 1 is show main menu of BSbox-tools console interface program. How we can see it is given some information about the program as current version, minimal requires compute capability, notification if minimal requires are fulfilled. After initial information their info about input and output files and then follows menu with the options. 

![header image](https://github.com/BoolSPL/BSbox-tools/blob/master/Images/BSbox-tools1.jpg)

##### Figure 1. Main menu of "BSbox-tools {Main menu GPU - CPU}" console interface program

The first submenu (figure 2) “1. Information for GPU(s) - Properties, Utilities, Bandwidth Test” can help to check GPU device Properties, Utilities and to perform Bandwidth Test. 

![header image](https://github.com/BoolSPL/BSbox-tools/blob/master/Images/BSbox-tools2.jpg)

##### Figure 2. Submenu “1. Information for GPU(s) - Properties, Utilities, Bandwidth Test”

The second submenu (figure 3) from the main menu “2. Compute cryptographic properties (GPU) of Boolean function” have option that compute cryptographic properties Walsh spectra, Linearity, Nonlinearity, Autocorrelation Spectra, Autocorrelation, Algebraic degree, Algebraic Normal Form from True Table and vice versa of Boolean function. GPU in brackets means that these procedures are executed parallel on GPU.

The third submenu from the main menu is the same as second, but the procedures are intended for CPU execution.

![header image](https://github.com/BoolSPL/BSbox-tools/blob/master/Images/BSbox-tools3.jpg)

##### Figure 3. Submenu “2. Compute cryptographic properties (GPU) of Boolean function”

The fourth submenu (figure 4) from the main menu “4. Compute cryptographic properties (GPU) of S-box(es)” have option that compute cryptographic properties Linear Approximation Table, Linearity, Nonlinearity, Autocorrelation Spectra, Autocorrelation, (bitwise) Algebraic Normal Form of input S-box(es), (bitwise) Algebraic degree, Component functions, Difference distribution table, Differential uniformity. GPU in brackets means that these procedures are executed parallel on GPU.

Тhe fifth submenu from the main menu is the same as fourth, but the procedures are intended for CPU execution. 

![header image](https://github.com/BoolSPL/BSbox-tools/blob/master/Images/BSbox-tools4.jpg)

##### Figure 4. Submenu “4. Compute cryptographic properties (GPU) of S-box(es)”

 Sixth and seventh submenu from the main menu are similar as second and third but here we can specify input parameters for investigation of Boolean functions. Eighth and ninth submenu from the main menu are similar as fourth and fifth but here we can specify input parameters for investigation of S-boxes. Option ten form the main menu give interface for random generation of test Boolean(s) function. Input parameter after choice option ten are input number of bits (n) and number for generate Boolean(s) functions. The next option (option eleven) from the main menu give interface for random generation of test S-box(es). Input parameter after choice option eleven are input number of bits (n) and number for generate S-box(es). Whit twelfth and thirteen form the main menu can be change the name of input or output file. Option fourteen and fifteen form the main menu can show content of input or output file. There is also option for information as “About” and “Help”.

In order to gain full functionality from BSbox-tools there is minimal requires for Nvidia GPU that need to be with Compute capability bigger then 3. If hardware doesn’t fulfil minimal requires it is possible to use BSbox-tools but with only CPU functionality figure 5. 

![header image](https://github.com/BoolSPL/BSbox-tools/blob/master/Images/BSbox-tools5.jpg)

##### Figure 5. Main menu of "BSbox-tools {Main menu CPU}" console interface program 

#### Input file "infile_exampl" format and output file (outfile_exampl)

Input file format have few input parameters that is similar for input Boolean function and S-box figure 6. 

![header image](https://github.com/BoolSPL/BSbox-tools/blob/master/Images/BSbox-input-web.jpg)

##### Figure 6. Input file (Boolean function, S-box) 

 Input parameters:

  1. Character “?” indicate start of parameter section.
  2. Character “0” indicate Boolean function, character “1” indicate S-box.
  3. Size of Boolean function or S-box.
  4. Number of bits (n).

Bits of Boolean function can set only with spaces.

Output file will contain result from computing cryptographic properties of Boolean function (or S-box).

### How do I get started using BSbox-tools?





For the windows user there need to be have install <a href="https://www.microsoft.com/en-us/download/details.aspx?id=40784">Visual C++ Redistributable Packages for Visual Studio 2013</a> to be able to run and use the BSbox-tools.

There is possibility to rebuild the BSbox-tools from the source code. Have in mind that BSbox-tools is developed on Visual Studio 2013. In order to rebuild BSbox-tools you need to have BoolSPL library (v0.2) (BoolSPL is implemented as a C++ header library) and there is timer function that is use from Boost C++ Libraries. 


