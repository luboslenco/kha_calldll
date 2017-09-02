package;

import kha.System;

@:headerCode('
#include <Windows.h>
#include <stdio.h>
typedef int (__cdecl *MYPROC)(void);
')

class Main {

	// https://msdn.microsoft.com/en-us/library/windows/desktop/ms686944(v=vs.85).aspx
	static function callDll():Int {
		untyped __cpp__('HINSTANCE hinstLib;');
		untyped __cpp__('MYPROC procAddr;');
		
		// Load dll
		untyped __cpp__('hinstLib = LoadLibrary(TEXT("Win32Project1.dll"));');
		untyped __cpp__('if (hinstLib == NULL) printf("Unable to load Win32Project1.dll!");');

		// Load function
		untyped __cpp__('procAddr = (MYPROC) GetProcAddress(hinstLib, "testFunction");');
		untyped __cpp__('if (procAddr == NULL) printf("Unable to load testFunction!");');

		// Call function
		var result = 0;
		untyped __cpp__('result = (procAddr)();');

		untyped __cpp__('FreeLibrary(hinstLib);');
		
		return result;
	}

	public static function main() {

		System.init({title: "Empty", width: 800, height: 600}, function() {
			
			trace('Result: ' + callDll());
		});
	}
}
