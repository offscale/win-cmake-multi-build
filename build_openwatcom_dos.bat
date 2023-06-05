@echo on

set OLD_PATH=%PATH%
set OLD_INCLUDE=%INCLUDE%
set OLD_LIB=%LIB%
set OLD_LIBPATH=%LIBPATH%

IF NOT DEFINED WATCOMINSTALLDIR (
  set WATCOMINSTALLDIR="C:\usr\WATCOM"
)
call "%WATCOMINSTALLDIR%\owsetenv.bat"

set build_dir="%cd%\build_dos"
IF EXIST "%build_dir%" rd /s /q "%build_dir%"
md "%build_dir%"
cd "%build_dir%"
cmake -DCMAKE_BUILD_TYPE="Debug" -G "Watcom WMake" -DCMAKE_SYSTEM_NAME="DOS" -DCMAKE_SYSTEM_PROCESSOR="I86" .. && cmake --build . && cpack -G "ZIP" -C "Debug" -DCPACK_ARCHIVE_FILE_EXTENSION=".zip"

set PATH=%OLD_PATH%
set INCLUDE=%OLD_INCLUDE%
set LIB=%OLD_LIB%
set LIBPATH=%OLD_LIBPATH%

cd ..
