@echo on

IF NOT DEFINED RELEASE_TAG (
  set RELEASE_TAG="0.0.2"
)

set release_archives=
for /f "tokens=*" %%G in ('dir /b /s /a:d "%cd%\build_*"') do  for /f "tokens=*" %%F in ('dir /b /a:-d %%G\"%~1"') do (
 IF /I "%%~xF"==".zip" call set release_archives=%%release_archives%% "%%G\%%F"
)

gh release upload "%RELEASE_TAG%" %release_archives%

set RELEASE_TAG=
