//@elp header file for time functions
#include <iostream>
#include <stdlib.h> 
#include <time.h> 

#include <algorithm> 
#include <chrono> 

#include <boost/chrono.hpp>


using namespace std;
using namespace std::chrono;

//high_resolution timer variables
boost::chrono::steady_clock::time_point start_nanosec, end_nanosec;
chrono::time_point<std::chrono::system_clock> start_microsec, end_microsec;

//Print Start Time
void ShowStartTime()
{
	char buffS[100];
	time_t now = time(0);
	strftime(buffS, 100, "== Start: %Y-%m-%d %H:%M:%S", localtime(&now));
	printf("%s\n", buffS);
}

//Print End Time
void ShowEndTime()
{
	char buffE[100];
	time_t now = time(0);
	strftime(buffE, 100, "== End: %Y-%m-%d %H:%M:%S", localtime(&now));
	printf("%s\n", buffE);

}


void getStartTimeComputation()
{
	if (sizeBool <= 1048576)
	{
		//@@Start Timer @@boost
		//boost::chrono::steady_clock::time_point start_nl_all = boost::chrono::steady_clock::now();
		start_nanosec = boost::chrono::steady_clock::now();
	}
	else
	{
		// Get starting timepoint 
		start_microsec = high_resolution_clock::now();
	}
}



void EndTimeComputationPrint()
{
	if (sizeBool <= 1048576)
	{
		end_nanosec = boost::chrono::steady_clock::now();
		typedef boost::chrono::duration<int, boost::nano> nanosecs_t;
		nanosecs_t duration(boost::chrono::duration_cast<nanosecs_t>(end_nanosec - start_nanosec));
		elapsedTime_computation_part = duration.count() / 1000.0;
		//printf("\nElapsed time (only computation): %f microseconds\n", elapsedTime_computation_part);

		elapsedTime_computation = elapsedTime_computation + elapsedTime_computation_part;
	}
	else
	{
		// Get ending timepoint 
		end_microsec = high_resolution_clock::now();
		auto duration = duration_cast<microseconds>(end_microsec - start_microsec);
		elapsedTime_computation_part = duration.count();

		//cout << "Time taken by function: " << elapsedTime_computation_part << " microseconds" << endl;

		elapsedTime_computation = elapsedTime_computation + elapsedTime_computation_part;
	}
}