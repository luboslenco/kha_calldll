// compile:
// g++ -shared -fPIC -o libCppDynaLibTest.so main.cpp

extern "C" int times_two(int in) {
    return in*2;
}
