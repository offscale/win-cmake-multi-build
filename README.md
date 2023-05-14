win-cmake-multi-build
=====================

Simple Windows Batch (command prompt [cmd.exe]) scripts to:

## Build, test, package

  - Cygwin;
  - MinGW (32-bit and 64-bit);
  - MSVC 2005 (32-bit and 64-bit);
  - MSVC 2022 (32-bit and 64-bit);
  - OpenWatcom's DOS target (16-bit).

## Add to GitHub releases

All .zip files in target directories (produced by `cpack` from above).

## Usage

From Command Prompt (cmd.exe) run:
```cmd
> :: Begin `cd`'d to directory with root CMakeLists.txt
> :: Override defaults with vars
> set CYGWININSTALLDIR="C:\cygwin"
> :: MSVC 2005
> set VSINSTALLDIR=C:\PROGRA~2\Microsoft Visual Studio 8
> set VS2022INSTALLDIR="C:\PROGRA~1\Microsoft Visual Studio\2022\Enterprise"
> set MINGW64INSTALLDIR="C:\msys64"
> [path_to_this_repo]\build_all
```

Which will create this data-structure:
```
├───build_cygwin
│   ├───projectname-0.0.5-CYGWIN.zip
│   └───_CPack_Packages
│───build_dos
│   ├───projectname-0.0.5-DOS.zip
│   └───_CPack_Packages
├───build_mingw64
│   ├───projectname-0.0.5-MINGW64_NT-10.0-22621.zip
│   └───_CPack_Packages
├───build_mingw86
│   ├───projectname-0.0.5-MINGW32_NT-10.0-22621.zip
│   └───_CPack_Packages
├───build_msvc64_2005
│   ├───projectname-0.0.5-msvc2005-win64.zip
│   └───_CPack_Packages
├───build_msvc64_2022
│   ├───projectname-0.0.5-msvc2022-win64.zip
│   └───_CPack_Packages
├───build_msvc86_2005
│   ├───projectname-0.0.5-msvc2005-win32.zip
│   └───_CPack_Packages
└───build_msvc86_2022
    ├───projectname-0.0.5-msvc2022-win32.zip
    └───_CPack_Packages
```

To populate and execute `gh release upload` to upload the first-level .zip files to GitHub releases, run:

```cmd
> :: Add all built .zip to GitHub releases
> set RELEASE_TAG="0.0.5"
> [path_to_this_repo]\release_to_gh
```

---

#### License

The person who associated a work with this deed has dedicated the work to the public domain by waiving all of his or her rights to the work worldwide under copyright law, including all related and neighboring rights, to the extent allowed by law.

You can copy, modify, distribute and perform the work, even for commercial purposes, all without asking permission.
