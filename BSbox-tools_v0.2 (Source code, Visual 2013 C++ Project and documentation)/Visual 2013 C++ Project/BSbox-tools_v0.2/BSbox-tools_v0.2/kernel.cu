////////////////////////////////////////////////////////////////////////////
//
// Copyright @2018 Dusan and Iliya.  All rights reserved.
//
// Please refer to the NVIDIA end user license agreement (EULA) associated
// with this source code for terms and conditions that govern your use of
// this software. Any use, reproduction, disclosure, or distribution of
// this software and related documentation outside the terms of the EULA
// is strictly prohibited.
//
////////////////////////////////////////////////////////////////////////////
//Example for using GPU BoolSPLG library procedures for Boolean function  
////////////////////////////////////////////////////////////////////////////

//System includes
#include <stdio.h>
#include <iostream>
#include <cstdlib>
#include <string>
#include <sstream>
#include <fstream>
#include <time.h>

// CUDA runtime
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

//Main Library header file
#include <BoolSPL02\BoolSPLG_v02.cuh> //#include "BoolSPLG_v0.cuh" 

//Output file 
std::ofstream myfile;

//Declaration strings for input and output files names
std::string infile_exampl = "infile_exampl";
std::string outfile_exampl = "outfile_exampl";


//@Global Time computation variables
double elapsedTime_computation_part=0, elapsedTime_computation=0;

//@@Global Size variable
int size = 0;

//@@Global Bool variables
int sizeBool;

//host vectors for Boolean function
int  *host_Bool_TT, *host_Bool_PTT, *host_GPUbool_rez, *walshvec_cpu, *rf_cpu, *anf_cpu;

//host vectors for Boolean Bitwise function
unsigned long long int *host_NumIntVecTT, *host_NumIntVecANF;
int *host_max_values_AD;

int *walshvec_gpu;

//device bool vectors
int *device_Bool, *device_Bool_TT, *device_Bool_PTT, *device_Bool_rez;

//Bitwise device vectors
unsigned long long int *device_NumIntVecTT, *device_NumIntVecANF;
int *device_max_values_AD;

//host vectors for S-box
int *LAT, *ACT, *ANF, *CF, *DDT, *PTT, *TT, *t, *WHT, *AC_all, *ANF_S, *DEG_ALL, *delta_ALL, *binary_num;

//device S-box vectors
int *device_Sbox, *device_CF, *device_LAT, *device_ACT, *device_ANF, *device_DDT;

//Bitwise ANF computation
unsigned long long int *NumIntVecTT, *NumIntVecANF; // , *mack_vec_Int;

//@Declaration of host - device vector for Bitwise ANF computation (S-box)
unsigned long long int *device_NumIntVecCF, *host_NumIntVecCF;
int *host_CF, *host_max_values, *device_Vec_max_values;


//@@S-box variables
int sizeSbox, binary = 0;

int *SboxElemet, *BoolElemet;


//@@Variable borders
int nl_gpuBorder = 0, AC_gpuBorder = 0, deg_gpuBorder = 0, delta_gpuBorder = 0;
int nl_cpuBorder = 0, AC_cpuBorder = 0, deg_cpuBorder = 0, delta_cpuBorder = 0;

//global variable
int choice1, choice2;

//function menu
void menu();
void mainMenu();

void menuCPU();
void mainMenuCPU();

void CUDA_Properties();
void CUDA_PropertiesMenu();

void CPU_boolMenu();
void CPU_bool();

void GPU_boolMenu();
void GPU_bool();

void CPU_SboxMenu();
void CPU_Sbox();

void GPU_SboxMenu();
void GPU_Sbox();

void findCPU_boolMenu();
void findCPU_bool();

void findGPU_boolMenu();
void findGPU_bool();

void findCPU_sboxMenu();
void findCPU_sbox();

void findGPU_sboxMenu();
void findGPU_sbox();

//Help Heder file - Input Output file
#include "InputOutputFiles.h"

//Help Header file - Time functions
#include "TimeHeader.h"

//Help Heder file - CPU computing boolean functions properties
#include "func_Boolean_CPU.h"
#include "funct_Sbox_CPU.h"

//Heder file 2D DynamicArray
#include "2D_DynamicArray.h"

//Help Heder file boolean computation functions
#include "HelpBoolFunctionGPU.h"
#include "HelpBoolFunctionCPU.h"

#include "HelpFindBoolFunctionCPU.h"
#include "HelpFindBoolFunctionGPU.h"


//Help Heder file S-box computation functions
#include "HelpSboxFunctionCPU.h"
#include "HelpSboxFunctionGPU.h"

#include "HelpFindSboxFunctionCPU.h"
#include "HelpFindSboxFunctionGPU.h"

//Header file that contain S-box generation
#include "GenBoolean.h"
#include "GenSboxes.h"

// === Menu Heders files ===
#include "MainMenuCPU.h"
#include "MainMenu.h"

//Menu Heders CUDA Properties
#include "CUDA_Properties_menu.h"

//Menu Heder CPU - GPU Bool Properties
#include "ComputePropMenuBoolGPU.h"
#include "ComputePropMenuBoolCPU.h"

//Menu Heder CPU - GPU S-box Properties
#include "ComputePropMenuSboxCPU.h"
#include "ComputePropMenuSboxGPU.h"

#include "FindMenuBoolCPU.h"
#include "FindMenuBoolGPU.h"
#include "FindMenuSboxCPU.h"
#include "FindMenuSboxGPU.h"

//Help Heder file - Check for hardware Requires
#include "CheckRequires.h"

using namespace std;

int main()
{
 
	printf("\n   Current release: v0.2 \n");

	cout << "\n==========================================================\n";
	//Function Check Hardware Requires
	BoolSPLGMinimalRequires1();
	cout << "\n==========================================================\n";

	//Function create Output files
	CreateOutputFile();

	//Function Open Main Menu
	menu();

    return 0;
}

