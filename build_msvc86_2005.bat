@echo on

set OLD_PATH=%PATH%
set OLD_INCLUDE=%INCLUDE%
set OLD_LIB=%LIB%
set OLD_LIBPATH=%LIBPATH%

IF NOT DEFINED VSINSTALLDIR (
  set VSINSTALLDIR="C:\PROGRA~2\Microsoft Visual Studio 8"
)
call %VSINSTALLDIR%"\VC\vcvarsall.bat"

set build_dir="%cd%\build_msvc86_2005"
IF EXIST "%build_dir%" rd /s /q "%build_dir%"
md "%build_dir%"
cd "%build_dir%"
cmake -DCMAKE_BUILD_TYPE="Debug" -G "NMake Makefiles" .. && cmake --build . && ctest -C "Debug" && cpack -G "ZIP" -C "Debug" && ren *.zip *-msvc2005-win32.zip

set PATH=%OLD_PATH%
set INCLUDE=%OLD_INCLUDE%
set LIB=%OLD_LIB%
set LIBPATH=%OLD_LIBPATH%

cd ..
