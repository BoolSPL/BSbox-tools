//Help Heder file "funct_Sbox_CPU.h" - CPU computing S-box functions properties
// System includes
#include <stdio.h>
#include <iostream>
#include <algorithm>

//declare global vector
//int *PTT, *TT, *WHT, *t, *FixPoin, *ANF; // SboxDec, *;

//int *PTT_ALL_LIN, *ADmax_all, *ADmin_all, *AC_all, *DDT_vect;

using namespace std;

//====== CPU computing max deg(S) function ========================
int AlgDegMax(int *ANF_CPU, int size)
{
	unsigned int ones = 0, max = 0;
	for (int i = 0; i<size; i++)
	{
		ones = _mm_popcnt_u32(i)*ANF_CPU[i];
		if (max<ones)
			max = ones;
		//if((min>ones)&(ones!=0))
		//	min=ones;

		//	cout <<ones<< " ";
	}
	//	cout <<"Alg. Deagree (max):" << max <<" Alg. Deagree (min):" << min <<"\n";	
	return max;
}
//=================================================================

//====== CPU computing DDT(S) function ============================
int DDT_vector(int *sbox, int dx, bool DDT)
{
	int* diff_table = new int[sizeSbox]();
	int Diff_cpu = 0;

	int x1, x2, dy;
	for (x1 = 0; x1 < sizeSbox; ++x1) {
		//  for (dx = 0; dx < sbox_size; ++dx) {
		x2 = x1 ^ dx;
		dy = sbox[x1] ^ sbox[x2];
		++diff_table[dy];
		// }
		if (diff_table[dy]>Diff_cpu)
			Diff_cpu = diff_table[dy];
	}

	if (DDT)
	{
		for (int i = 0; i < sizeSbox; ++i) {
			// std::cout << std::setw(4) << diff_table[i];
			//cout << " " << diff_table[i];
			myfile << " " << diff_table[i];
		}
		myfile << "\n";
	}

	delete[] diff_table;

	return Diff_cpu;
}
//=================================================================

//====== CPU computing DDT(S) function ============================
int FindDelta_CPU(int *sbox, int dx)
{
	int* diff_table = new int[sizeSbox]();
	int Diff_cpu = 0;

	int x1, x2, dy;
	for (x1 = 0; x1 < sizeSbox; ++x1) {
		//  for (dx = 0; dx < sbox_size; ++dx) {
		x2 = x1 ^ dx;
		dy = sbox[x1] ^ sbox[x2];
		++diff_table[dy];
		// }
		if (diff_table[dy]>Diff_cpu)
			Diff_cpu = diff_table[dy];
	}

	delete[] diff_table;

	return Diff_cpu;
}
//=================================================================

//===== CPU computing component function (CF) of S-box function ===
//===== One CF is save in array CPU_STT ===========================
void GenTTComponentFuncVec(int *SboxElemet, int j)
{
	unsigned int ones = 0, logI, element;

	for (int i = 0; i<sizeSbox; i++)
	{
		logI = SboxElemet[i] & j;
		// ones = _mm_popcnt_u32(SboxElemet[i]);
		ones = _mm_popcnt_u32(logI);
		//cout << ones << " ";
		// cout << logI << " ";
		if (ones % 2 == 0)
			element = 0;
		else
			element = 1;

		//		cout << element << ", ";

		//CPU_STT[i] = element;
		myfile << element << " ";
	}
	myfile << "\n";
	//	cout <<"\n";
}
//=================================================================