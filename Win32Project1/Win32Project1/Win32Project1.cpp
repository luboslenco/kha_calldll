// Win32Project1.cpp : Defines the exported functions for the DLL application.
//

#include "stdafx.h"

#ifdef __cplusplus, 
extern "C" {
#endif

__declspec(dllexport) int __cdecl testFunction() {
	return 6;
}

#ifdef __cplusplus
}
#endif
