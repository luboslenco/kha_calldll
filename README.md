# kha_calldll

Example on calling a C++ function from `.dll` on Windows. Visual Studio project for the library being loaded is located at [/Win32Project1](https://github.com/luboslenco/kha_calldll/tree/master/Win32Project1). This project exports a function:

```cpp
__declspec(dllexport) int __cdecl testFunction() {
	return 6;
}
```

Afterwards, the function is [called from Haxe](https://github.com/luboslenco/kha_calldll/blob/master/Sources/Main.hx):

```hx
static function callDll():Int {
	// ...
	untyped __cpp__('hinstLib = LoadLibrary(TEXT("Win32Project1.dll"));');
	untyped __cpp__('procAddr = (MYPROC)GetProcAddress(hinstLib, "testFunction");');
	var result = 0;
	untyped __cpp__('result = (procAddr)();');
	// ...
}
```

Clone repository and run:

```
git clone --recursive https://github.com/luboslenco/kha_calldll
node Kha/make --run
```

Expected output:

`Main.hx:36: Result: 6`
