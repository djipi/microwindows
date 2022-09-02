@echo off
cls
echo.
echo Build microwindows library, and tests applications, for the Atari Jaguar
echo.

if %1.==. goto usage
if %1.==HELP. goto usage
if %2.==. goto builwo2
if %2.==ALL. goto ALL
if %3.==. goto builwo3
make -f Makefile %1 cmd=%1 env=%2 support=%3
goto end

:ALL
if %3.==. goto ALLwo3
:ALLw3
make -f Makefile %1 cmd=%1 env=Debug support=%3
make -f Makefile %1 cmd=%1 env=Profile support=%3
make -f Makefile %1 cmd=%1 env=Release support=%3
goto end
:ALLwo3
make -f Makefile %1 cmd=%1 env=Debug support=NULL
make -f Makefile %1 cmd=%1 env=Profile support=NULL
make -f Makefile %1 cmd=%1 env=Release support=NULL
goto end

:builwo2
make -f Makefile %1 cmd=%1 env=Debug support=NULL
goto end

:builwo3
make -f Makefile %1 cmd=%1 env=%2 support=NULL
goto end

:usage
echo Usage:
echo:build HELP
echo -----
echo Usage:
echo "build <all | clean[_...] | compile[_...] | config | HELP | library | link[_...] | makedirs | mkdir_[...] | rebuild | report_[...] | reports_[...] | Runtime | winextra> <ALL | Debug | Profile | Release> <SKUNKBOARD | NULL>"
echo -----
echo Debug (default)
echo NULL (default)
if %1.==HELP. goto HELP
goto end

:HELP
echo -----
echo all : incremental build source
echo -----
echo clean : clean all
echo -----
echo clean[_...] can be empty or be completed with:
echo d : remove the *.d files from the project
echo demos : remove all demos
echo images_sources_generated_demos : remove the sources generated from the bitmaps for the demos
echo libs : remove the libraries (images included)
echo maps : remove all map files
echo obj : remove the *.o files from the lib and demos (Runtime not included)
echo reports : remove the dump and report text files
echo Runtime : remove the Runtime *.o files
echo s : remove the *.s files (from C compilation in case of -S option has been set)
echo su : remove the *.su files from the project
echo -----
echo compile : compile all
echo -----
echo compile[_...] can be empty or be completed with:
echo demos : demos compilation
echo drivers : drivers compilation
echo engine : engine compilation
echo fonts : fonts compilation
echo images : images compilation
echo lib : all libraries compilation
echo mwin : mwin compilation
echo winextra : winextra compilation [Not to be used]
echo winlib : mwin/wlinlib compilation
echo -----
echo config : display the makefile configuration
echo -----
echo library[_...] can be empty or be completed with:
echo winextra : create the winextra library [Not to be used]
echo -----
echo link : create all demos executable (same as link_demos)
echo -----
echo link[_...] can be empty or be completed with:
echo demo : create dedicated demo executable
echo demos : create all demos executable
echo -----
echo HELP : display this help page
echo -----
echo makedirs : create the necessary directories
echo -----
echo mkdir_[...] must be completed with:
echo d : create d's directories
echo obj : create obj's directories
echo reports : create reports's directories
echo Runtime : create Runtime's directories
echo s : create s's directories
echo su : create su's directories
echo -----
echo rebuild : clean, rebuild sources to make a fresh new build
echo -----
echo Runtime : create Runtime obj
echo -----
echo report_[...] must be completed with:
echo debug_dump : dump the debug information to text files
echo stack : generate a stack usage report based on generated *.su files
echo -----
echo reports : generate all reports available
echo -----
echo reports_[...] must be completed with:
echo winextra : generate reports available for winextra [Not to be used]
echo -----
echo winextra : handle the winextra library
goto end

:end
echo.
@echo on
