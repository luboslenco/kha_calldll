package;

import kha.System;

@:headerCode('
#include <dlfcn.h>
#include <iostream>

extern "C" typedef int (*times_two_t)(int in);
')

class Main {

	static function timesTwo(a:Int):Int {
		
		// Load lib
		untyped __cpp__('void* handle = dlopen("./libCppDynaLibTest.so", RTLD_LAZY);');
		untyped __cpp__('if (!handle) { std::cerr << "Cannot open library: " << dlerror() << std::endl; return 1; }');

		// Load function
		untyped __cpp__('times_two_t times_two = (times_two_t) dlsym(handle, "times_two");');

		// Call function
		var result = 0;
		untyped __cpp__('result = times_two(a)');

		// Unload lib
		untyped __cpp__('dlclose(handle);');
		
		return result;
	}

	public static function main() {

		System.init({title: "Empty", width: 800, height: 600}, function() {
			
			trace('5 * 2 = ' + timesTwo(5));
		});
	}
}
