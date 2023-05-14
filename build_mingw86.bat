@echo on

IF NOT DEFINED MINGW64INSTALLDIR (
  set MINGW64INSTALLDIR="C:\usr\msys64"
)

set build_dir="%cd%\build_mingw86"
IF EXIST "%build_dir%" rd /s /q "%build_dir%"
md "%build_dir%"
cd "%build_dir%"

call %MINGW64INSTALLDIR%"\msys2_shell.cmd" -defterm -no-start -here -mingw32 -c "cmake -DCMAKE_BUILD_TYPE='Debug' .. && cmake --build . && ctest -C 'Debug' && cpack -G 'ZIP' -C 'Debug'"
cd ..
