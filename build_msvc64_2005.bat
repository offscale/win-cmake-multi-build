@echo on

set OLD_PATH=%PATH%
IF NOT DEFINED VSINSTALLDIR (
  set VSINSTALLDIR="C:\PROGRA~2\Microsoft Visual Studio 8"
)
call %VSINSTALLDIR%"\VC\vcvarsall.bat" "x64"

set build_dir="%cd%\build_msvc64_2005"
IF EXIST "%build_dir%" rd /s /q "%build_dir%"
md "%build_dir%"
cd "%build_dir%"
cmake -DCMAKE_BUILD_TYPE="Debug" -G "NMake Makefiles" .. && cmake --build . && ctest -C "Debug" && cpack -G "ZIP" -C "Debug" && ren *.zip *-msvc2005-win64.zip
set PATH=%OLD_PATH%
cd ..
