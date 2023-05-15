@echo on

set OLD_PATH=%PATH%
IF NOT DEFINED VS2022INSTALLDIR (
  set VS2022INSTALLDIR=C:\PROGRA~1\Microsoft Visual Studio\2022\Enterprise
)
call %VS2022INSTALLDIR%"\VC\Auxiliary\Build\vcvarsall.bat" amd64

set build_dir="%cd%\build_msvc64_2022"
IF EXIST "%build_dir%" rd /s /q "%build_dir%"
md "%build_dir%"
cd "%build_dir%"
cmake -DCMAKE_BUILD_TYPE="Debug" -G "Visual Studio 17 2022" -A "x64" .. && cmake --build . && ctest -C "Debug" && cpack -G "ZIP" -C "Debug" && ren *.zip *-msvc2022-win64.zip
set PATH=%OLD_PATH%
cd ..
