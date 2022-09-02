# Parameters list
#
# support is used for Skunkboard usage
# env is used
# cmd sets the command / order to be used


# Check the make version
MAKE_VERSION := $(shell make -v 2>/dev/null)
ifneq ($(findstring 4.3, $(MAKE_VERSION)), 4.3)
$(error make version must be 4.3 or upper)
endif
# Check python setup
DOT := $(shell command -v python 2> /dev/null)
ifndef DOT
$(error No setup for Python found)
endif
# Check perl setup
DOT := $(shell command -v perl 2> /dev/null)
ifndef DOT
$(error No setup for Perl found)
endif


# Support detection
#
ifndef support
$(error support is missing)
else
ifeq ($(support), SKUNKBOARD)
SUPPORT_D = -DSKUNKBOARD
SUPPORT_d = -dSKUNKBOARD
SUPPORT_LIB = _SKUNKBOARD
$(info support is recognised, but SKUNKBOARD is not supported)
else
ifeq ($(support), NULL)
else
$(error support is not recognised, must be either SKUNKBOARD, or NULL)
endif
endif
endif

# Environement detections
#
ifdef env
ifneq ($(env), Debug)
ifneq ($(env), Release)
ifneq ($(env), Profile)
$(error env is not recognised; must be either Debug, Profile, Release)
endif
endif
endif
VERSION = $(shell python -c "print('$(env)'.upper())")
else
$(error env is missing; must be either Debug, Profile, Release)
endif


# Base microwindows directories
#
#C:/Projects/microwindows/src
MW_BASE_SRC	= ../../..
#C:/Projects/microwindows/src/contrib/ports/ajaguar
MW_AJAGUAR_PRJ = .


# Configuration
#
# Compilation verbose
Q := @
#
# Include the configuration file
include $(MW_BASE_SRC)/config
#
# winextra detection
ifeq ($(WINEXTRA), Y)
$(error WINEXTRA must not be requested in config, please set it as N instead of Y)
endif
#
# Configuration detection from config file
ifeq ($(DEBUG), Y)
ifneq ($(env), Debug)
$(error env ($(env)) is not the same set in the config.ajaguar file)
endif
endif
#
# Include the tools executables and paths
include config.mk


# Executable selection (elf, srec)
EXE_FORMAT = $(FORMAT)
# Libraries selection (lib-gcc, lib-m68k)
VERSION_LIB	= lib-m68k
# FDLIBM version (5.2-2, 5.3)
FDLIBMVer = 5.2-2
# Get asm from source C (yes, no)
GET_SFromC = no
# Library base
ifeq ($(MICROWIN), Y)
BASEMW = mw
endif
# Lib M68K version (1.0, 1.1)
LIB_M68K_VERSION  = 1.1
# OSJAG version (1.0, 1.1)
OSJAG_VERSION = 1.1
# Microwindows version
ifeq (, $(wildcard "$(MW_BASE_SRC)/Version"))
VERLIB = $(file < $(MW_BASE_SRC)/Version)
else
$(error VERLIB cannot be set, $(MW_BASE_SRC)/Version file was not found)
endif
# Multiple libraries (yes, no)
MULTILIBS = no
# Demo base
ifeq ($(MICROWINDEMO), Y)
DEMOBASE = mwin
else
$(error demo base is not set or wrongly dispatched)
endif
# Demo filename
DEMONAME = $(BASEMW)simple

# Source directories list
#
C_DEMOS_DIR		= $(MW_BASE_SRC)/demos/$(DEMOBASE)
C_IMAGES_DIR	= $(MW_BASE_SRC)/images/demos/$(DEMOBASE)
C_MWIN_DIR		= $(MW_BASE_SRC)/mwin
C_WINEXTRA_DIR	= $(MW_BASE_SRC)/contrib/winextra
C_WINLIB_DIR	= $(MW_BASE_SRC)/mwin/winlib
C_ENGINE_DIR	= $(MW_BASE_SRC)/engine
C_DRIVERS_DIR	= $(MW_BASE_SRC)/drivers
C_FONTS_DIR		= $(MW_BASE_SRC)/fonts
#
IMAGES_DEMOS_DIR	=	$(MW_BASE_SRC)/images/demos/$(DEMOBASE)
#
# Runtime, arguments, OSJAG & crt directories lists
#
SR_ARGVS_DIR	= $(MW_AJAGUAR_PRJ)/demos/mwin
OSJAGFILES_DIR	= $(MW_AJAGUAR_PRJ)/demos/mwin
SR_DIR 			= $(MW_AJAGUAR_PRJ)/demos/Runtime
#
# Out directories list
#
DEMOS_DIR	= $(MW_AJAGUAR_PRJ)/demos/$(DEMOBASE)/$(env)
EXE_DIR		= $(DEMOS_DIR)
LIB_DIR		= $(MW_AJAGUAR_PRJ)/lib/$(env)
IMAGES_DIR	= $(MW_AJAGUAR_PRJ)/lib/$(env)
#
# Objects (from C compilation) directories list
#
O_LIB_DIR		= $(LIB_DIR)/obj/$(FORMAT)
O_MWIN_DIR		= $(O_LIB_DIR)/$(COMPILER_SELECT)/mwin
O_WINEXTRA_DIR	= $(O_LIB_DIR)/$(COMPILER_SELECT)/contrib/winextra
O_WINLIB_DIR	= $(O_LIB_DIR)/$(COMPILER_SELECT)/mwin/winlib
O_ENGINE_DIR	= $(O_LIB_DIR)/$(COMPILER_SELECT)/engine
O_DRIVERS_DIR	= $(O_LIB_DIR)/$(COMPILER_SELECT)/drivers
O_FONTS_DIR		= $(O_LIB_DIR)/$(COMPILER_SELECT)/fonts
#
O_IMAGES_DIR	= $(IMAGES_DIR)/obj/$(FORMAT)/$(COMPILER_SELECT)/images/demos/$(DEMOBASE)
#
O_RUNTIME_DIR		= $(DEMOS_DIR)/obj/$(FORMAT)
O_OSJAGFILES_DIR	= $(DEMOS_DIR)/obj/$(FORMAT)
O_DEMOS_DIR			= $(DEMOS_DIR)/obj/$(FORMAT)/$(COMPILER_SELECT)
O_ARGVS_DIR			= $(O_DEMOS_DIR)/Runtime
#
# ASM sources (from C compilation) directories list
#
S_LIB_DIR		= $(LIB_DIR)/s/$(FORMAT)
S_MWIN_DIR		= $(S_LIB_DIR)/$(COMPILER_SELECT)/mwin
S_WINEXTRA_DIR	= $(S_LIB_DIR)/$(COMPILER_SELECT)/contrib/winextra
S_WINLIB_DIR	= $(S_LIB_DIR)/$(COMPILER_SELECT)/mwin/winlib
S_ENGINE_DIR	= $(S_LIB_DIR)/$(COMPILER_SELECT)/engine
S_DRIVERS_DIR	= $(S_LIB_DIR)/$(COMPILER_SELECT)/drivers
S_FONTS_DIR 	= $(S_LIB_DIR)/$(COMPILER_SELECT)/fonts
#
S_IMAGES_DIR	= $(IMAGES_DIR)/s/$(FORMAT)/$(COMPILER_SELECT)/images/demos/$(DEMOBASE)
#
S_DEMOS_DIR		= $(DEMOS_DIR)/s/$(FORMAT)/$(COMPILER_SELECT)
#
# Reports directories list
#
LIB_DUMP_DIR		= $(LIB_DIR)/reports/$(COMPILER_SELECT)
LIB_REPORTS_DIR		= $(LIB_DIR)/reports/$(COMPILER_SELECT)
DEMOS_DUMP_DIR		= $(DEMOS_DIR)/reports/$(COMPILER_SELECT)/$(DEMONAME)
DEMOS_REPORTS_DIR	= $(DEMOS_DIR)/reports/$(COMPILER_SELECT)/$(DEMONAME)
IMAGES_DUMP_DIR		= $(IMAGES_DIR)/reports/$(COMPILER_SELECT)
IMAGES_REPORTS_DIR	= $(IMAGES_DIR)/reports/$(COMPILER_SELECT)
#
EXE_FILENAME	=	$(DEMONAME)_$(env)_$(COMPILER_SELECT).$(ALNExt)

# Defines for the compiler, tools and assembler
CCDefine = -DPATH_MAX=260 -D$(ARCH) -DHAVE_SIGNAL=0 -DHAVE_MMAP=0 -DNOMAIN=0 -DMOUSE=$(MOUSE) -DKEYBOARD=$(KEYBOARD) -DSCREEN=$(SCREEN) -DSCREEN_WIDTH=$(SCREEN_WIDTH) -DSCREEN_HEIGHT=$(SCREEN_HEIGHT) -DSCREEN_PIXTYPE=$(SCREEN_PIXTYPE) -DMWPIXEL_FORMAT=$(SCREEN_PIXTYPE) -DSCREEN_DEPTH=$(SCREEN_DEPTH)
ifneq ($(INTL), Y)
CCDefine += -DMW_FEATURE_INTL=0
endif
ifeq ($(NOCLIPPING), Y)
CCDefine += -DNOCLIPPING=1
endif
ifeq ($(NOFONTS), Y)
CCDefine += -DNOFONTS=1
endif
ifneq ($(HAVE_PORTRAIT_SUPPORT), Y)
CCDefine += -DMW_FEATURE_PORTRAIT=0
endif
ifeq ($(SCREEN_PIXTYPE), MWPF_PALETTE)
CCDefine += -DMW_FEATURE_PALETTE=1
ifeq ($(SCREEN_DEPTH), 1)
CCDefine += -DNOSTDPAL2=1 -DNOSTDPAL4=1 -DNOSTDPAL8=1
else ifeq ($(SCREEN_DEPTH), 2)
CCDefine += -DNOSTDPAL1=1 -DNOSTDPAL4=1 -DNOSTDPAL8=1
else ifeq ($(SCREEN_DEPTH), 4)
CCDefine += -DNOSTDPAL1=1 -DNOSTDPAL2=1 -DNOSTDPAL8=1
else ifeq ($(SCREEN_DEPTH), 8)
CCDefine += -DNOSTDPAL1=1 -DNOSTDPAL2=1 -DNOSTDPAL4=1
endif
else
CCDefine += -DMW_FEATURE_PALETTE=0
endif
ifeq ($(DEBUG), Y)
CCDefine += -DDEBUG=1 -D_DEBUG
else
CCDefine += -D$(VERSION)
endif
ifeq ($(WINEXTRA), Y)
CCDefine += -DWINEXTRA=1
endif
ifeq ($(EMBEDDED), Y)
CCDefine += -DEMBEDDED=1
endif
ifneq ($(ERASEMOVE), Y)
CCDefine += -DERASEMOVE=0
endif
ifneq ($(UPDATEREGIONS), Y)
CCDefine += -DUPDATEREGIONS=0
endif
ifeq ($(HAVE_FREETYPE_2_SUPPORT), Y)
CCDefine += -DHAVE_FREETYPE_2_SUPPORT=1
endif
ifeq ($(HAVE_FILEIO), Y)
CCDefine += -DHAVE_FILEIO=1
endif
ifeq ($(HAVE_BMP_SUPPORT), Y)
CCDefine += -DHAVE_BMP_SUPPORT=1
endif
ifeq ($(HAVE_GIF_SUPPORT), Y)
CCDefine += -DHAVE_GIF_SUPPORT=1
endif
ifeq ($(HAVE_PNM_SUPPORT), Y)
CCDefine += -DHAVE_PNM_SUPPORT=1
endif
ifeq ($(HAVE_XPM_SUPPORT), Y)
CCDefine += -DHAVE_XPM_SUPPORT=1
endif
ifeq ($(HAVE_JPEG_SUPPORT), Y)
CCDefine += -DHAVE_JPEG_SUPPORT=1
endif
ifeq ($(HAVE_PNG_SUPPORT), Y)
CCDefine += -DHAVE_PNG_SUPPORT=1
endif
ifeq ($(HAVE_TIFF_SUPPORT), Y)
CCDefine += -DHAVE_TIFF_SUPPORT=1
endif
ifeq ($(HAVE_PCF_SUPPORT), Y)
CCDefine += -DHAVE_PCF_SUPPORT=1
endif
ifeq ($(HAVE_FNT_SUPPORT), Y)
CCDefine += -DHAVE_FNT_SUPPORT=1
endif

# C compiler information
#
# VBcc, GCC, and Clang
#
H_INC = -I$(MW_BASE_SRC)/include -IC:\SDK\AJaguar\OfficialJaguarKit\INCLUDE
ifeq ($(WINEXTRA), Y)
H_INC += -I$(WINEXTRA_INCLUDE)
endif
#
# GCC & Clang
#
ifeq ($(GCCMatch), yes)
CCOpt = -c -m68000 -Wall -Wextra -MD -MP
# Verbose configuration
ifeq ($(VERBOSE), Y)
CCOpt += -v
endif
# Options configuration
ifeq ($(FORMAT), elf)
ifneq ($(env), Release)
CCOpt += -gdwarf-2
endif
endif
#-fno-align-functions
#Debug
ifeq ($(env), Debug)
CCOpt += -g -O0
# -mno-align-int -mstrict-align
# -gdwarf-2 -Werror -msoft-float -malign-int -fno-leading-underscore -MD -MP -fstack-usage -pedantic-errors -Wfatal-errors
else
#Release
ifeq ($(env), Release)
CCOpt += -fomit-frame-pointer -Ofast -DNDEBUG
# -Werror -Wfatal-errors
else
# Profile
ifeq ($(env), Profile)
CCOpt += -pg -g -O0 -fstack-usage -DDEBUG
# -pedantic-errors -Wfatal-errors
else
$(error $(env) is not recognised, or not configured)
endif
endif
endif
#-D NO_LIBGCC_A -D INT_8_BITS -D _SUPPORT_ARGS -D_USE_STDINT 
#SDK_INC = -IC:/SDK/Jaguar/jlibc-0.5.8/include
#-I./src/OSJag -I./src/DirectJag
#-IC:/SDK/Jaguar/jlibc-0.5.10/include -IC:/SDK/Jaguar/glibc-2.20/include
#OPENGL_INC = -IC:/Projects/TinyGL/JaGL/include
#WARP_INC = -IC:/SDK/Jaguar/jlibc-0.5.8/include
CC_INC = -I$(CCINC1) -I$(CCINC2)
# -IC:/Projects/Lib-M68K/include
WARP_INC = -IC:/Projects/Lib-M68K/include
#WIN_INC = -I./src/WinJag
#-IC:/Projects/mingw32/include
#-I./Sys
GET_SFromC_Option = -S
else
#
# VBcc
#
ifeq ($(COMPILER_C_TYPE), vbcc)
CCOpt = -cpu=68000 -merge-strings -c -no-trigraphs
#Debug
ifeq ($(env), Debug)
CCOpt += -O0 -g -stack-check -no-delayed-popping
else
#Release, Profile & Retail
CCOpt += -O2 -final -unroll-all -prefer-statics -range-opt -speed
CCDefine += -DNDEBUG
#Retail
ifeq ($(env), Retail)
CCOpt += -warnings-as-errors -warn=-1
else
#Profile
ifeq ($(env), Profile)
CCOpt += -prof
endif
endif
endif
#SDK_INC =
#OPENGL_INC =
#CC_INC =
#H_INC =
#WIN_INC =
GET_SFromC_Option = -S
else
#
# Compiler not set
#
$(error C compiler type is not set or wrongly dispatched)
endif
endif

# ASM information
#
ifeq ($(ASM), smac)
ifeq ($(FORMAT), aout)
ASMOpt = -fb -rp -v -iC:/SDK/Jaguar/OfficialJaguarKit/Include -d$(VERSION) -d$(ASM) -s
#C:\SDK\Jaguar\ATARIJaguarSDK\INCLUDE
else
$(error $(FORMAT) is not recognised, or not configured)
endif
else
ifeq ($(ASM), vasm)
ASMOpt = -m68000 -F$(FORMAT) -D$(VERSION)=1 -D$(ASM)
ifeq ($(VERSION), RELEASE)
ASMOpt += -DDEBUG=0 -DPROFILE=0
endif
ifeq ($(VERSION), DEBUG)
ASMOpt += -dwarf=3 -DRELEASE=0 -DPROFILE=0
endif
ifeq ($(VERSION), PROFILE)
ASMOpt += -dwarf=3 -DDEBUG=1 -DRELEASE=0
endif
else
$(error $(ASM) is not recognised, or not configured)
endif
endif

# Linker information
#
## Vlink linker information
ifeq ($(LINKER_SELECT),vlink)
ifeq ($(FORMAT), elf)
ALNFLAGS = -b elf32jag -T mwELFls_$(VERSION_LIB)_$(env) -EB -e _start -M
ALNFLAGS_DRAM8MB = -b elf32jag -T mwELFls_$(VERSION_LIB)_$(env)_DRAM8MB -EB -e _start -M
# -M -t
# elf32m68k
ALNExt=elf
else
STADDR = 4000
ALNFLAGS = -M -b aoutjaguar -t -sc -sd -EB -e _start -Ttext 0x$(STADDR)
# -C gnu
ALNExt=bin
endif
else
$(error $(LINKER_SELECT) is not recognised, or not configured)
endif

# External libraries information
ifeq ($(VERSION_LIB), lib-m68k)
DIR_LIBS = $(DEMOS_DIR)/Lib
LIB_GCC = $(DIR_LIBS)/libgcc-$(LIB_M68K_VERSION)_$(env)-M68K.$(FORMAT).a
LIBC = $(DIR_LIBS)/libc-$(LIB_M68K_VERSION)_$(env)-M68K.$(FORMAT).a
LIBM = $(DIR_LIBS)/libm-$(LIB_M68K_VERSION)_$(env)-M68K.$(FORMAT).a
LIB_EXTRN = $(DEMOS_DIR)/Lib/fdlibm/fdlibm-$(FDLIBMVer)_IEEE_LIBM_$(env)_m68k-gcc-$(COMPILER_C_VERSION).$(FORMAT).a
else
ifeq ($(VERSION_LIB), lib-gcc)
DIR_LIBS =
LIB_GCC = $(DIRLIBGCC)/libgcc.a
LIBC = $(DIRLIBC)/libc.a $(DIRLIBC)/libbcc.a
LIBM = $(DIRLIBC)/libm.a
LIB_EXTRN =
else
$(error $(VERSION_LIB) is not set or wrongly dispatched)
endif
endif
#
LIB_OS = $(DEMOS_DIR)/Lib/OSJag/$(DEMOBASE)OSJag-$(OSJAG_VERSION)_$(env)_$(COMPILER_SELECT).$(FORMAT).a

# Lib information
#
## GNU library information
AR_OPT = cru
# rs
ARAN_OPT =
LIBExt = a
#
# Library name
LIBMW_FILENAME = $(BASEMW)$(VERLIB)_$(env)_m68k-$(COMPILER_SELECT).$(FORMAT).$(LIBExt)
LIBMWIN_FILENAME = $(BASEMW)$(VERLIB)-Mwin_$(env)_m68k-$(COMPILER_SELECT).$(FORMAT).$(LIBExt)
LIBWINEXTRA_FILENAME = $(BASEMW)$(VERLIB)-Winextra_$(env)_m68k-$(COMPILER_SELECT).$(FORMAT).$(LIBExt)
LIBENGINE_FILENAME = $(BASEMW)$(VERLIB)-Engine_$(env)_m68k-$(COMPILER_SELECT).$(FORMAT).$(LIBExt)
LIBDRIVERS_FILENAME = $(BASEMW)$(VERLIB)-Drivers_$(env)_m68k-$(COMPILER_SELECT).$(FORMAT).$(LIBExt)
LIBFONTS_FILENAME = $(BASEMW)$(VERLIB)-Fonts_$(env)_m68k-$(COMPILER_SELECT).$(FORMAT).$(LIBExt)
LIBIMAGES_FILENAME = $(BASEMW)$(VERLIB)-$(DEMOBASE)-Images_$(env)_m68k-$(COMPILER_SELECT).$(FORMAT).$(LIBExt)

# Tools information
TODOS = C:\Tools\tfd1713\todos
TODOS_OPT = -o -u -v
CONVBMP = $(MW_BASE_SRC)\images\vs2017\tools\x64\Release\convbmp

# Dependencies list
DEPENDENCE_LIST	= build.bat makefile $(MW_BASE_SRC)/config
# $(LIB_OS) $(LIB_EXTRN) $(LIB_GCC) $(LIB_C) $(LIB_M)


# Check directory existence
#
ifneq ($(cmd), makedirs)
ifneq ($(cmd), config)
ifeq ("$(wildcard $(O_DEMOS_DIR))","")
$(error the directories to create $(EXE_FILENAME) don't exist, please use makedirs command)
endif
endif
endif


compile:			compile_lib \
					compile_images \
					compile_demos
#
# Library compilation
compile_lib:		compile_mwin \
					compile_winlib \
					compile_engine \
					compile_drivers \
					compile_fonts
#
# Link demos executable
link:				link_demos
#
# Winextra specifics
winextra:			compile_winextra \
					library_winextra \
					reports_winextra

assemble:			Runtime

rebuild:			clean \
					all
			
all:				assemble \
					compile \
					library \
					link_demo
#
# Libraries creations
library:			$(LIB_DIR)/$(LIBMW_FILENAME) \
					$(LIB_DIR)/$(LIBENGINE_FILENAME) \
					$(LIB_DIR)/$(LIBMWIN_FILENAME) \
					$(LIB_DIR)/$(LIBDRIVERS_FILENAME) \
					$(LIB_DIR)/$(LIBFONTS_FILENAME) \
					$(LIB_DIR)/$(LIBIMAGES_FILENAME)
#
library_winextra:	$(LIB_DIR)/$(LIBWINEXTRA_FILENAME)


# Object lists
#
include $(MW_BASE_SRC)/demos/$(DEMOBASE)/Makefile.ajaguar
include $(MW_BASE_SRC)/mwin/Makefile.ajaguar
include $(MW_BASE_SRC)/mwin/winlib/Makefile.ajaguar
include $(MW_BASE_SRC)/engine/Makefile.ajaguar
include $(MW_BASE_SRC)/drivers/Makefile.ajaguar
include $(MW_BASE_SRC)/fonts/Makefile.ajaguar
include $(MW_BASE_SRC)/images/Makefile.ajaguar
#
# Runtime objects list
ObjRuntime		=	$(O_RUNTIME_DIR)/STARTUP.o \
					$(O_OSJAGFILES_DIR)/$(DEMONAME)_OSJAG_Directory.o
#
ObjRuntime_d	=
#
# winextra objects list
ObjWINEXTRA		=	$(O_WINEXTRA_DIR)/setenv.o \
					$(O_WINEXTRA_DIR)/stub_winevent.o \
					$(O_WINEXTRA_DIR)/stub_winuser.o \
					$(O_WINEXTRA_DIR)/stub_winfont.o \
					$(O_WINEXTRA_DIR)/stub_wingdi.o \
					$(O_WINEXTRA_DIR)/stub_winrgn.o
#
ObjWINEXTRA_d	=	$(O_WINEXTRA_DIR)/setenv.d \
					$(O_WINEXTRA_DIR)/stub_winevent.d \
					$(O_WINEXTRA_DIR)/stub_winfont.d \
					$(O_WINEXTRA_DIR)/stub_wingdi.d \
					$(O_WINEXTRA_DIR)/stub_winrgn.d \
					$(O_WINEXTRA_DIR)/stub_winuser.d


# Runtime
Runtime:	$(ObjRuntime)
#
include $(ObjRuntime_d)
#
$(O_RUNTIME_DIR)/STARTUP.o: $(SR_DIR)/STARTUP.s $(MW_AJAGUAR_PRJ)/makefile $(MW_BASE_SRC)/config
	@echo -e "\033[01;33m***\033[00;32m Assembling $< for the demo's runtime...\033[00m"
	$(Q)$(ASMProg) $< $(ASMOpt) -o $@
#
$(O_OSJAGFILES_DIR)/$(DEMONAME)_OSJAG_Directory.o: $(OSJAGFILES_DIR)/$(DEMONAME)_OSJAG_Directory.asm $(MW_AJAGUAR_PRJ)/makefile $(MW_BASE_SRC)/config
	@echo -e "\033[01;33m***\033[00;32m Assembling $< for the demo's directory...\033[00m"
	$(Q)$(ASMProg) $< $(ASMOpt) -o $@


# winextra
#
compile_winextra:	$(ObjWINEXTRA)
#
# Include the dependence file
ifeq ($(WINEXTRA), Y)
include $(ObjWINEXTRA_d)
endif
#
$(O_WINEXTRA_DIR)/setenv.d:
$(O_WINEXTRA_DIR)/setenv.o: $(C_WINEXTRA_DIR)/setenv.c $(O_WINEXTRA_DIR)/setenv.d $(MW_BASE_SRC)/config
	@echo -e "\033[01;33m***\033[00;32m Compiling $< for winextra library...\033[00m"
	$(Q)$(CCProg) $< $(CCOpt) $(CCDefine) $(SDK_INC) $(CC_INC) $(H_INC) $(WIN_INC) -o $@
ifeq ($(GET_SFromC),yes)	
	$(Q)$(CCProg) $< $(CCOpt) $(GET_SFromC_Option) $(CCDefine) $(SDK_INC) $(CC_INC) $(H_INC) $(WIN_INC) -o $(S_WINEXTRA_DIR)/setenv.s
endif
#
$(O_WINEXTRA_DIR)/stub_winevent.d:
$(O_WINEXTRA_DIR)/stub_winevent.o: $(C_WINEXTRA_DIR)/stub_winevent.c $(O_WINEXTRA_DIR)/stub_winevent.d $(MW_BASE_SRC)/config
	@echo -e "\033[01;33m***\033[00;32m Compiling $< for winextra library...\033[00m"
	$(Q)$(CCProg) $< $(CCOpt) $(CCDefine) $(SDK_INC) $(CC_INC) $(H_INC) $(WIN_INC) -o $@
ifeq ($(GET_SFromC),yes)	
	$(Q)$(CCProg) $< $(CCOpt) $(GET_SFromC_Option) $(CCDefine) $(SDK_INC) $(CC_INC) $(H_INC) $(WIN_INC) -o $(S_WINEXTRA_DIR)/stub_winevent.s
endif
#
$(O_WINEXTRA_DIR)/stub_winfont.d:
$(O_WINEXTRA_DIR)/stub_winfont.o: $(C_WINEXTRA_DIR)/stub_winfont.c $(O_WINEXTRA_DIR)/stub_winfont.d $(MW_BASE_SRC)/config
	@echo -e "\033[01;33m***\033[00;32m Compiling $< for winextra library...\033[00m"
	$(Q)$(CCProg) $< $(CCOpt) $(CCDefine) $(SDK_INC) $(CC_INC) $(H_INC) $(WIN_INC) -o $@
ifeq ($(GET_SFromC),yes)	
	$(Q)$(CCProg) $< $(CCOpt) $(GET_SFromC_Option) $(CCDefine) $(SDK_INC) $(CC_INC) $(H_INC) $(WIN_INC) -o $(S_WINEXTRA_DIR)/stub_winfont.s
endif
#
$(O_WINEXTRA_DIR)/stub_wingdi.d:
$(O_WINEXTRA_DIR)/stub_wingdi.o: $(C_WINEXTRA_DIR)/stub_wingdi.c $(O_WINEXTRA_DIR)/stub_wingdi.d $(MW_BASE_SRC)/config
	@echo -e "\033[01;33m***\033[00;32m Compiling $< for winextra library...\033[00m"
	$(Q)$(CCProg) $< $(CCOpt) $(CCDefine) $(SDK_INC) $(CC_INC) $(H_INC) $(WIN_INC) -o $@
ifeq ($(GET_SFromC),yes)	
	$(Q)$(CCProg) $< $(CCOpt) $(GET_SFromC_Option) $(CCDefine) $(SDK_INC) $(CC_INC) $(H_INC) $(WIN_INC) -o $(S_WINEXTRA_DIR)/stub_wingdi.s
endif
#
$(O_WINEXTRA_DIR)/stub_winrgn.d:
$(O_WINEXTRA_DIR)/stub_winrgn.o: $(C_WINEXTRA_DIR)/stub_winrgn.c $(O_WINEXTRA_DIR)/stub_winrgn.d $(MW_BASE_SRC)/config
	@echo -e "\033[01;33m***\033[00;32m Compiling $< for winextra library...\033[00m"
	$(Q)$(CCProg) $< $(CCOpt) $(CCDefine) $(SDK_INC) $(CC_INC) $(H_INC) $(WIN_INC) -o $@
ifeq ($(GET_SFromC),yes)	
	$(Q)$(CCProg) $< $(CCOpt) $(GET_SFromC_Option) $(CCDefine) $(SDK_INC) $(CC_INC) $(H_INC) $(WIN_INC) -o $(S_WINEXTRA_DIR)/stub_winrgn.s
endif
#
$(O_WINEXTRA_DIR)/stub_winuser.d:
$(O_WINEXTRA_DIR)/stub_winuser.o: $(C_WINEXTRA_DIR)/stub_winuser.c $(O_WINEXTRA_DIR)/stub_winuser.d $(MW_BASE_SRC)/config
	@echo -e "\033[01;33m***\033[00;32m Compiling $< for winextra library...\033[00m"
	$(Q)$(CCProg) $< $(CCOpt) $(CCDefine) $(SDK_INC) $(CC_INC) $(H_INC) $(WIN_INC) -o $@
ifeq ($(GET_SFromC),yes)	
	$(Q)$(CCProg) $< $(CCOpt) $(GET_SFromC_Option) $(CCDefine) $(SDK_INC) $(CC_INC) $(H_INC) $(WIN_INC) -o $(S_WINEXTRA_DIR)/stub_winuser.s
endif


# Library mwin objects lists
LIBMWIN_OBJS =	$(ObjMWIN) \
				$(ObjWINLIB)
#
# Library engine objects lists
LIBENGINE_OBJS =	$(ObjENGINE)
#
# Library drivers objects lists
LIBDRIVERS_OBJS =	$(ObjDRIVERS)
#
# Library images objects lists
LIBIMAGES_OBJS = $(ObjIMAGES)
#
# Library fonts objects lists
LIBFONTS_OBJS =	$(ObjFONTS)
#
# Library winextra objects lists
LIBWINEXTRA_OBJS =	$(ObjWINEXTRA)
#
# Unique library objects lists but without images and winextra libraries
LIBMW_OBJS =	$(LIBMWIN_OBJS) \
				$(LIBDRIVERS_OBJS)
ifeq ($(ENGINE), Y)
LIBMW_OBJS +=	$(LIBENGINE_OBJS)
endif
ifneq ($(NOFONTS), Y)
LIBMW_OBJS +=	$(LIBFONTS_OBJS)
endif


# Library creation
$(LIB_DIR)/$(LIBMW_FILENAME):	$(LIBMW_OBJS) $(DEPENDENCE_LIST)
	@echo -e "\033[01;33m***\033[00;32m Creating the full library...\033[00m"
	$(Q)$(ARProg) $(AR_OPT) $(LIB_DIR)/$(LIBMW_FILENAME) $(LIBMW_OBJS)
	$(Q)$(ARANProg) $(ARAN_OPT) $(LIB_DIR)/$(LIBMW_FILENAME)
#
# Library images creation
$(LIB_DIR)/$(LIBIMAGES_FILENAME):	$(LIBIMAGES_OBJS) $(DEPENDENCE_LIST)
	@echo -e "\033[01;33m***\033[00;32m Creating the images library...\033[00m"
	$(Q)$(ARProg) $(AR_OPT) $(LIB_DIR)/$(LIBIMAGES_FILENAME) $(LIBIMAGES_OBJS)
	$(Q)$(ARANProg) $(ARAN_OPT) $(LIB_DIR)/$(LIBIMAGES_FILENAME)
#
# Library engine creation
$(LIB_DIR)/$(LIBENGINE_FILENAME):	$(LIBENGINE_OBJS) $(DEPENDENCE_LIST)
ifeq ($(ENGINE), Y)
ifeq ($(MULTILIBS), yes)
	@echo -e "\033[01;33m***\033[00;32m Creating the engine library...\033[00m"
	$(Q)$(ARProg) $(AR_OPT) $(LIB_DIR)/$(LIBENGINE_FILENAME) $(LIBENGINE_OBJS)
	$(Q)$(ARANProg) $(ARAN_OPT) $(LIB_DIR)/$(LIBENGINE_FILENAME)
endif
endif
#
# Library fonts creation
$(LIB_DIR)/$(LIBFONTS_FILENAME):	$(LIBFONTS_OBJS) $(DEPENDENCE_LIST)
ifeq ($(MULTILIBS), yes)
	@echo -e "\033[01;33m***\033[00;32m Creating the fonts library...\033[00m"
	$(Q)$(ARProg) $(AR_OPT) $(LIB_DIR)/$(LIBFONTS_FILENAME) $(LIBFONTS_OBJS)
	$(Q)$(ARANProg) $(ARAN_OPT) $(LIB_DIR)/$(LIBFONTS_FILENAME)	
endif
#
# Library drivers creation
$(LIB_DIR)/$(LIBDRIVERS_FILENAME):	$(LIBDRIVERS_OBJS) $(DEPENDENCE_LIST)
ifeq ($(MULTILIBS), yes)
	@echo -e "\033[01;33m***\033[00;32m Creating the drivers library...\033[00m"
	$(Q)$(ARProg) $(AR_OPT) $(LIB_DIR)/$(LIBDRIVERS_FILENAME) $(LIBDRIVERS_OBJS)
	$(Q)$(ARANProg) $(ARAN_OPT) $(LIB_DIR)/$(LIBDRIVERS_FILENAME)
endif
#
# Library mwin creation
$(LIB_DIR)/$(LIBMWIN_FILENAME):	$(LIBMWIN_OBJS) $(DEPENDENCE_LIST)
ifeq ($(MULTILIBS), yes)
	@echo -e "\033[01;33m***\033[00;32m Creating the mwin library...\033[00m"
	$(Q)$(ARProg) $(AR_OPT) $(LIB_DIR)/$(LIBMWIN_FILENAME) $(LIBMWIN_OBJS)
	$(Q)$(ARANProg) $(ARAN_OPT) $(LIB_DIR)/$(LIBMWIN_FILENAME)
endif
#
# Library winextra creation
$(LIB_DIR)/$(LIBWINEXTRA_FILENAME):	$(LIBWINEXTRA_OBJS) $(DEPENDENCE_LIST)
	@echo -e "\033[01;33m***\033[00;32m Creating the winextra library...\033[00m"
	$(Q)$(ARProg) $(AR_OPT) $(LIB_DIR)/$(LIBWINEXTRA_FILENAME) $(LIBWINEXTRA_OBJS)
	$(Q)$(ARANProg) $(ARAN_OPT) $(LIB_DIR)/$(LIBWINEXTRA_FILENAME)


# Reports creation
#
reports:	report_stack \
			report_debug_dump
#
# Reports winextra
reports_winextra:	$(LIB_REPORTS_DIR)/$(LIBWINEXTRA_FILENAME).StackReport.txt \
					report_debug_dump
#
# Stack usage reports
report_stack:	$(LIB_REPORTS_DIR)/$(LIBMW_FILENAME).StackReport.txt \
				$(LIB_REPORTS_DIR)/$(LIBENGINE_FILENAME).StackReport.txt \
				$(LIB_REPORTS_DIR)/$(LIBDRIVERS_FILENAME).StackReport.txt \
				$(LIB_REPORTS_DIR)/$(LIBMWIN_FILENAME).StackReport.txt \
				$(LIB_REPORTS_DIR)/$(LIBFONTS_FILENAME).StackReport.txt \
				$(LIB_REPORTS_DIR)/$(LIBIMAGES_FILENAME).StackReport.txt
#
# Reports list
$(LIB_REPORTS_DIR)/$(LIBMW_FILENAME).StackReport.txt: $(LIB_DIR)/$(LIBMW_FILENAME) Build.bat
	c:/Perl64/bin/perl.exe avstack.pl $(LIBMW_OBJS) > $@
$(LIB_REPORTS_DIR)/$(LIBENGINE_FILENAME).StackReport.txt: $(LIB_DIR)/$(LIBENGINE_FILENAME) Build.bat
	c:/Perl64/bin/perl.exe avstack.pl $(LIBENGINE_OBJS) > $@
$(LIB_REPORTS_DIR)/$(LIBDRIVERS_FILENAME).StackReport.txt: $(LIB_DIR)/$(LIBDRIVERS_FILENAME) Build.bat
	c:/Perl64/bin/perl.exe avstack.pl $(LIBDRIVERS_OBJS) > $@
$(LIB_REPORTS_DIR)/$(LIBMWIN_FILENAME).StackReport.txt: $(LIB_DIR)/$(LIBMWIN_FILENAME) Build.bat
	c:/Perl64/bin/perl.exe avstack.pl $(LIBMWIN_OBJS) > $@
$(LIB_REPORTS_DIR)/$(LIBFONTS_FILENAME).StackReport.txt: $(LIB_DIR)/$(LIBFONTS_FILENAME) Build.bat
	c:/Perl64/bin/perl.exe avstack.pl $(LIBFONTS_OBJS) > $@	
$(LIB_REPORTS_DIR)/$(LIBWINEXTRA_FILENAME).StackReport.txt: $(LIB_DIR)/$(LIBWINEXTRA_FILENAME) Build.bat
	c:/Perl64/bin/perl.exe avstack.pl $(LIBWINEXTRA_OBJS) > $@
$(LIB_REPORTS_DIR)/$(LIBIMAGES_FILENAME).StackReport.txt: $(LIB_DIR)/$(LIBIMAGES_FILENAME) Build.bat
	c:/Perl64/bin/perl.exe avstack.pl $(LIBFONTS_OBJS) > $@	
#
# Debug dump executables reports
#
report_debug_dump:	$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).ReadElf.txt \
					$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).rawline.txt \
					$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).decodedline.txt \
					$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).info.txt \
					$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).abbrev.txt \
					$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).pubnames.txt \
					$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).aranges.txt \
					$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).macro.txt \
					$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).frames.txt \
					$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).frames-interp.txt \
					$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).str.txt \
					$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).loc.txt \
					$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).Ranges.txt \
					$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).pubtypes.txt \
					$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).gdb_index.txt \
					$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).trace_info.txt \
					$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).trace_abbrev.txt \
					$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).trace_aranges.txt \
					$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).addr.txt \
					$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).cu_index.txt \
					$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).links.txt \
					$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).follow-links.txt
# Dump list
ifeq	($(FORMAT), elf)
$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).ReadElf.txt:	$(EXE_DIR)/$(EXE_FILENAME) makefile Build.bat
	$(readelf) -W -a $(EXE_DIR)/$(EXE_FILENAME) > $@
	$(TODOS) $(TODOS_OPT) $@
$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).rawline.txt:	$(EXE_DIR)/$(EXE_FILENAME) makefile Build.bat
	$(readelf) -W --debug-dump=rawline $(EXE_DIR)/$(EXE_FILENAME) > $@
	$(TODOS) $(TODOS_OPT) $@
$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).decodedline.txt:	$(EXE_DIR)/$(EXE_FILENAME) makefile Build.bat
	$(readelf) -W --debug-dump=decodedline $(EXE_DIR)/$(EXE_FILENAME) > $@
	$(TODOS) $(TODOS_OPT) $@
$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).info.txt:	$(EXE_DIR)/$(EXE_FILENAME) makefile Build.bat
	$(readelf) -W --debug-dump=info $(EXE_DIR)/$(EXE_FILENAME) > $@
	$(TODOS) $(TODOS_OPT) $@
$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).abbrev.txt:	$(EXE_DIR)/$(EXE_FILENAME) makefile Build.bat
	$(readelf) -W --debug-dump=abbrev $(EXE_DIR)/$(EXE_FILENAME) > $@
	$(TODOS) $(TODOS_OPT) $@
$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).pubnames.txt:	$(EXE_DIR)/$(EXE_FILENAME) makefile Build.bat
	$(readelf) -W --debug-dump=pubnames $(EXE_DIR)/$(EXE_FILENAME) > $@
	$(TODOS) $(TODOS_OPT) $@
$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).aranges.txt:	$(EXE_DIR)/$(EXE_FILENAME) makefile Build.bat
	$(readelf) -W --debug-dump=aranges $(EXE_DIR)/$(EXE_FILENAME) > $@
	$(TODOS) $(TODOS_OPT) $@
$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).macro.txt:	$(EXE_DIR)/$(EXE_FILENAME) makefile Build.bat
	$(readelf) -W --debug-dump=macro $(EXE_DIR)/$(EXE_FILENAME) > $@
	$(TODOS) $(TODOS_OPT) $@
$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).frames.txt:	$(EXE_DIR)/$(EXE_FILENAME) makefile Build.bat
	$(readelf) -W --debug-dump=frames $(EXE_DIR)/$(EXE_FILENAME) > $@
	$(TODOS) $(TODOS_OPT) $@
$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).frames-interp.txt:	$(EXE_DIR)/$(EXE_FILENAME) makefile Build.bat
	$(readelf) -W --debug-dump=frames-interp $(EXE_DIR)/$(EXE_FILENAME) > $@
	$(TODOS) $(TODOS_OPT) $@
$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).str.txt:	$(EXE_DIR)/$(EXE_FILENAME) makefile Build.bat
	$(readelf) -W --debug-dump=str $(EXE_DIR)/$(EXE_FILENAME) > $@
	$(TODOS) $(TODOS_OPT) $@
$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).loc.txt:	$(EXE_DIR)/$(EXE_FILENAME) makefile Build.bat
	$(readelf) -W --debug-dump=loc $(EXE_DIR)/$(EXE_FILENAME) > $@
	$(TODOS) $(TODOS_OPT) $@
$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).Ranges.txt:	$(EXE_DIR)/$(EXE_FILENAME) makefile Build.bat
	$(readelf) -W --debug-dump=Ranges $(EXE_DIR)/$(EXE_FILENAME) > $@
	$(TODOS) $(TODOS_OPT) $@
$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).pubtypes.txt:	$(EXE_DIR)/$(EXE_FILENAME) makefile Build.bat
	$(readelf) -W --debug-dump=pubtypes $(EXE_DIR)/$(EXE_FILENAME) > $@
	$(TODOS) $(TODOS_OPT) $@
$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).gdb_index.txt:	$(EXE_DIR)/$(EXE_FILENAME) makefile Build.bat
	$(readelf) -W --debug-dump=gdb_index $(EXE_DIR)/$(EXE_FILENAME) > $@
	$(TODOS) $(TODOS_OPT) $@
$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).trace_info.txt:	$(EXE_DIR)/$(EXE_FILENAME) makefile Build.bat
	$(readelf) -W --debug-dump=trace_info $(EXE_DIR)/$(EXE_FILENAME) > $@
	$(TODOS) $(TODOS_OPT) $@
$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).trace_abbrev.txt:	$(EXE_DIR)/$(EXE_FILENAME) makefile Build.bat
	$(readelf) -W --debug-dump=trace_abbrev $(EXE_DIR)/$(EXE_FILENAME) > $@
	$(TODOS) $(TODOS_OPT) $@
$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).trace_aranges.txt:	$(EXE_DIR)/$(EXE_FILENAME) makefile Build.bat
	$(readelf) -W --debug-dump=trace_aranges $(EXE_DIR)/$(EXE_FILENAME) > $@
	$(TODOS) $(TODOS_OPT) $@
$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).addr.txt:	$(EXE_DIR)/$(EXE_FILENAME) makefile Build.bat
	$(readelf) -W --debug-dump=addr $(EXE_DIR)/$(EXE_FILENAME) > $@
	$(TODOS) $(TODOS_OPT) $@
$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).cu_index.txt:	$(EXE_DIR)/$(EXE_FILENAME) makefile Build.bat
	$(readelf) -W --debug-dump=cu_index $(EXE_DIR)/$(EXE_FILENAME) > $@
	$(TODOS) $(TODOS_OPT) $@
$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).links.txt:	$(EXE_DIR)/$(EXE_FILENAME) makefile Build.bat
	$(readelf) -W --debug-dump=links $(EXE_DIR)/$(EXE_FILENAME) > $@
	$(TODOS) $(TODOS_OPT) $@
$(DEMOS_DUMP_DIR)/$(EXE_FILENAME).follow-links.txt:	$(EXE_DIR)/$(EXE_FILENAME) makefile Build.bat
	$(readelf) -W --debug-dump=follow-links $(EXE_DIR)/$(EXE_FILENAME) > $@
	$(TODOS) $(TODOS_OPT) $@
endif					


# Project clean-up
#
clean:	clean_obj \
		clean_su \
		clean_d \
		clean_s \
		clean_libs \
		clean_demos \
		clean_images_sources_generated_demos \
		clean_maps \
		clean_Runtime \
		clean_reports
#
# Delete the libraries
clean_libs:
		@echo -e "\033[01;33m***\033[00;32m Removing the library files...\033[00m"	
		$(Q)rm -f $(LIB_DIR)/$(LIBMW_FILENAME)
		$(Q)rm -f $(LIB_DIR)/$(LIBMWIN_FILENAME)
		$(Q)rm -f $(LIB_DIR)/$(LIBWINEXTRA_FILENAME)
		$(Q)rm -f $(LIB_DIR)/$(LIBENGINE_FILENAME)
		$(Q)rm -f $(LIB_DIR)/$(LIBDRIVERS_FILENAME)
		$(Q)rm -f $(LIB_DIR)/$(LIBFONTS_FILENAME)
		$(Q)rm -f $(LIB_DIR)/$(LIBIMAGES_FILENAME)
#
# Delete the demos executable
clean_demos:
		@echo -e "\033[01;33m***\033[00;32m Removing the demos...\033[00m"	
		$(Q)rm -f $(DEMOS_DIR)/$(BASEMW)*_$(env)_$(COMPILER_SELECT).$(ALNExt)
#
# Delete the sources generated from the bitmaps for the demos
clean_images_sources_generated_demos:
		@echo -e "\033[01;33m***\033[00;32m Removing the bitmaps's demos generated files...\033[00m"	
		$(Q)rm -f $(CIMAGES)
#
# Delete the map files from demos executable
clean_maps:
		@echo -e "\033[01;33m***\033[00;32m Removing the map generated files...\033[00m"	
		$(Q)rm -f $(DEMOS_DIR)/*_$(env)_$(COMPILER_SELECT).$(ALNExt).map
#
# Delete the object files
clean_obj:
		@echo -e "\033[01;33m***\033[00;32m Removing the obj files...\033[00m"	
		$(Q)rm -f $(O_MWIN_DIR)/*.o
		$(Q)rm -f $(O_WINLIB_DIR)/*.o
		$(Q)rm -f $(O_WINEXTRA_DIR)/*.o
		$(Q)rm -f $(O_ENGINE_DIR)/*.o
		$(Q)rm -f $(O_DRIVERS_DIR)/*.o
		$(Q)rm -f $(O_FONTS_DIR)/*.o
		$(Q)rm -f $(O_DEMOS_DIR)/*.o
		$(Q)rm -f $(O_IMAGES_DIR)/*/*.o
#
# Delete the stack usage files
clean_su:
		@echo -e "\033[01;33m***\033[00;32m Removing the stack usage generated files...\033[00m"	
		$(Q)rm -f $(O_MWIN_DIR)/*.su
		$(Q)rm -f $(O_WINLIB_DIR)/*.su
		$(Q)rm -f $(O_WINEXTRA_DIR)/*.su
		$(Q)rm -f $(O_ENGINE_DIR)/*.su
		$(Q)rm -f $(O_DRIVERS_DIR)/*.su
		$(Q)rm -f $(O_OFONTS_DIR)/*.su
		$(Q)rm -f $(O_DEMOS_DIR)/*.su
		$(Q)rm -f $(O_IMAGES_DIR)/*/*.su
#
# Delete the dependence files
clean_d:
		@echo -e "\033[01;33m***\033[00;32m Removing the dependency files...\033[00m"	
		$(Q)rm -f $(O_MWIN_DIR)/*.d
		$(Q)rm -f $(O_WINLIB_DIR)/*.d
		$(Q)rm -f $(O_WINEXTRA_DIR)/*.d
		$(Q)rm -f $(O_ENGINE_DIR)/*.d
		$(Q)rm -f $(O_DRIVERS_DIR)/*.d
		$(Q)rm -f $(O_FONTS_DIR)/*.d
		$(Q)rm -f $(O_DEMOS_DIR)/*.d
		$(Q)rm -f $(O_IMAGES_DIR)/*/*.d
#
# Delete the asm files generated by compilation		
clean_s:
		@echo -e "\033[01;33m***\033[00;32m Removing the asm sources generated from C compilation...\033[00m"	
		$(Q)rm -f $(S_MWIN_DIR)/*.s
		$(Q)rm -f $(S_WINLIB_DIR)/*.s
		$(Q)rm -f $(S_WINEXTRA_DIR)/*.s
		$(Q)rm -f $(S_ENGINE_DIR)/*.s
		$(Q)rm -f $(S_DRIVERS_DIR)/*.s
		$(Q)rm -f $(S_FONTS_DIR)/*.s
		$(Q)rm -f $(S_DEMOS_DIR)/*.s
		$(Q)rm -f $(S_IMAGES_DIR)/*/*.s
#
# Delete the Runtime's object, stack usage, asm generated and dependence files
clean_Runtime:
		@echo -e "\033[01;33m***\033[00;32m Removing the Runtime generated files...\033[00m"	
		$(Q)rm -f $(O_RUNTIME_DIR)/STARTUP.o
		$(Q)rm -f $(O_ARGVS_DIR)/*.o
		$(Q)rm -f $(O_OSJAGFILES_DIR)/*.o
#
# Delete reports
clean_reports:
		@echo -e "\033[01;33m***\033[00;32m Removing the report files...\033[00m"	
		$(Q)rm -f $(LIB_DUMP_DIR)/$(LIBMW_FILENAME)*.txt
		$(Q)rm -f $(LIB_DUMP_DIR)/$(LIBMWIN_FILENAME)*.txt
		$(Q)rm -f $(LIB_DUMP_DIR)/$(LIBWINEXTRA_FILENAME)*.txt
		$(Q)rm -f $(LIB_DUMP_DIR)/$(LIBENGINE_FILENAME)*.txt
		$(Q)rm -f $(LIB_DUMP_DIR)/$(LIBDRIVERS_FILENAME)*.txt
		$(Q)rm -f $(LIB_DUMP_DIR)/$(LIBFONTS_FILENAME)*.txt
		$(Q)rm -f $(LIB_REPORTS_DIR)/*.txt
		$(Q)rm -f $(DEMOS_REPORTS_DIR)/*.txt
		$(Q)rm -f $(DEMOS_DUMP_DIR)/*.txt
		$(Q)rm -f $(IMAGES_REPORTS_DIR)/*.txt
		$(Q)rm -f $(IMAGES_DUMP_DIR)/*.txt


# Create directories
#
makedirs:	mkdir_reports \
			mkdir_Runtime \
			mkdir_obj \
			mkdir_su \
			mkdir_d \
			mkdir_s
#
# Create the Runtime's object, stack usage and dependence files directories
mkdir_Runtime:
		@echo -e "\033[01;33m***\033[00;32m Creating the Runtime directory...\033[00m"
		$(Q)test -d $(O_RUNTIME_DIR) || echo Create $(O_RUNTIME_DIR) && mkdir -p "$(O_RUNTIME_DIR)"
		$(Q)test -d $(O_ARGVS_DIR) || echo Create $(O_ARGVS_DIR) && mkdir -p "$(O_ARGVS_DIR)"
		$(Q)test -d $(O_OSJAGFILES_DIR) || echo Create $(O_OSJAGFILES_DIR) && mkdir -p "$(O_OSJAGFILES_DIR)"
#
# Create the reports files directories
mkdir_reports:
		@echo -e "\033[01;33m***\033[00;32m Creating the reports directories...\033[00m"
		$(Q)test -d $(LIB_DUMP_DIR) || echo Create $(LIB_DUMP_DIR) && mkdir -p "$(LIB_DUMP_DIR)"
		$(Q)test -d $(LIB_REPORTS_DIR) || echo Create $(LIB_REPORTS_DIR) && mkdir -p "$(LIB_REPORTS_DIR)"
		$(Q)test -d $(DEMOS_DUMP_DIR) || echo Create $(DEMOS_DUMP_DIR) && mkdir -p "$(DEMOS_DUMP_DIR)"
		$(Q)test -d $(DEMOS_REPORTS_DIR) || echo Create $(DEMOS_REPORTS_DIR) && mkdir -p "$(DEMOS_REPORTS_DIR)"
		$(Q)test -d $(IMAGES_DUMP_DIR) || echo Create $(IMAGES_DUMP_DIR) && mkdir -p "$(IMAGES_DUMP_DIR)"
		$(Q)test -d $(IMAGES_REPORTS_DIR) || echo Create $(IMAGES_REPORTS_DIR) && mkdir -p "$(IMAGES_REPORTS_DIR)"
#
# Create the object, stack usage and dependence files directories
mkdir_obj:
mkdir_su:
mkdir_d:
		@echo -e "\033[01;33m***\033[00;32m Creating the dependencies and objs directories...\033[00m"
		$(Q)test -d $(O_MWIN_DIR) || echo Create $(O_MWIN_DIR) && mkdir -p "$(O_MWIN_DIR)"
		$(Q)test -d $(O_WINLIB_DIR) || echo Create $(O_WINLIB_DIR) && mkdir -p "$(O_WINLIB_DIR)"
		$(Q)test -d $(O_WINEXTRA_DIR) || echo Create $(O_WINEXTRA_DIR) && mkdir -p "$(O_WINEXTRA_DIR)"
		$(Q)test -d $(O_ENGINE_DIR) || echo Create $(O_ENGINE_DIR) && mkdir -p "$(O_ENGINE_DIR)"
		$(Q)test -d $(O_DRIVERS_DIR) || echo Create $(O_DRIVERS_DIR) && mkdir -p "$(O_DRIVERS_DIR)"
		$(Q)test -d $(O_FONTS_DIR) || echo Create $(O_FONTS_DIR) && mkdir -p "$(O_FONTS_DIR)"
		$(Q)test -d $(O_DEMOS_DIR) || echo Create $(O_DEMOS_DIR) && mkdir -p "$(O_DEMOS_DIR)"
		$(Q)test -d $(O_IMAGES_DIR) || echo Create $(O_IMAGES_DIR) && mkdir -p "$(O_IMAGES_DIR)"
		$(Q)test -d $(O_IMAGES_DIR)/mwmine || echo Create $(O_IMAGES_DIR)/mwmine && mkdir -p "$(O_IMAGES_DIR)/mwmine"
#
# Create the asm files, generated by compilation, directories		
mkdir_s:
		@echo -e "\033[01;33m***\033[00;32m Creating the generated asm directories...\033[00m"
		$(Q)test -d $(S_MWIN_DIR) || echo Create $(S_MWIN_DIR) && mkdir -p "$(S_MWIN_DIR)"
		$(Q)test -d $(S_WINLIB_DIR) || echo Create $(S_WINLIB_DIR) && mkdir -p "$(S_WINLIB_DIR)"
		$(Q)test -d $(S_WINEXTRA_DIR) || echo Create $(S_WINEXTRA_DIR) && mkdir -p "$(S_WINEXTRA_DIR)"
		$(Q)test -d $(S_ENGINE_DIR) || echo Create $(S_ENGINE_DIR) && mkdir -p "$(S_ENGINE_DIR)"
		$(Q)test -d $(S_DRIVERS_DIR) || echo Create $(S_DRIVERS_DIR) && mkdir -p "$(S_DRIVERS_DIR)"
		$(Q)test -d $(S_FONTS_DIR) || echo Create $(S_FONTS_DIR) && mkdir -p "$(S_FONTS_DIR)"
		$(Q)test -d $(S_DEMOS_DIR) || echo Create $(S_DEMOS_DIR) && mkdir -p "$(S_DEMOS_DIR)"
		$(Q)test -d $(S_IMAGES_DIR) || echo Create $(S_IMAGES_DIR) && mkdir -p "$(S_IMAGES_DIR)"
		$(Q)test -d $(S_IMAGES_DIR)/mwmine || echo Create $(S_IMAGES_DIR)/mwmine && mkdir -p "$(S_IMAGES_DIR)/mwmine"

		
# Display configuration
#
config:	config_command \
		config_demo \
		config_generic \
		config_compiler \
		config_configuration \
		config_demos_library \
		config_library
#
# Display the command from batch
config_command:
	$(info ----------------- Command)
	$(info Environement    : $(env))
	$(info Support         : $(support))
#
# Display the command for the libraries
config_demo:
	$(info ----------------- Demo)
	$(info Demo name       : $(DEMONAME))
#
# Display the command for the libraries used by the demo
config_demos_library:
	$(info ----------------- Library for demos)
	$(info Maths           : $(LIBM))
	$(info C               : $(LIBC))
	$(info GCC             : $(LIB_GCC))
	$(info External        : $(LIB_EXTRN))
#
# Display the command for the libraries
config_library:
	$(info ----------------- Library)
	$(info Microwindows    : $(VERLIB))
	$(info Multiple libs   : $(MULTILIBS))
#
# Display generic information
config_generic:
	$(info ----------------- Generic)
	$(info Make version    : $(MAKE_VERSION))
	$(info Format          : $(FORMAT))
	$(info Assembler       : $(ASM))
	$(info Compiler        : $(COMPILER_C_TYPE) $(COMPILER_C_VERSION))
#
# Display compiler configuration
config_compiler:
	$(info ----------------- Compiler)
	$(info Defines         : $(CCDefine))
#
# Display configuration
config_configuration:
	$(info ----------------- Configuration)
	$(info BMP format      : $(HAVE_BMP_SUPPORT))
	$(info Clipping        : $(NOCLIPPING))
	$(info Debug           : $(DEBUG))
	$(info Embedded        : $(EMBEDDED))
	$(info Erase move      : $(ERASEMOVE))
	$(info File I/O        : $(HAVE_FILEIO))
	$(info FNT format      : $(HAVE_FNT_SUPPORT))
	$(info Fonts support   : $(NOFONTS))
	$(info Freetype 2      : $(HAVE_FREETYPE_2_SUPPORT))    
	$(info GIF format      : $(HAVE_GIF_SUPPORT))
	$(info International   : $(INTL))
	$(info JPEG format     : $(HAVE_JPEG_SUPPORT))
	$(info Keyboard        : $(KEYBOARD))
	$(info Mouse           : $(MOUSE))
	$(info PCF format      : $(HAVE_PCF_SUPPORT))
	$(info Pixel type      : $(SCREEN_PIXTYPE))
	$(info PNG format      : $(HAVE_PNG_SUPPORT))
	$(info PNM format      : $(HAVE_PNM_SUPPORT))
	$(info Portrait        : $(HAVE_PORTRAIT_SUPPORT))
	$(info Screen depth    : $(SCREEN_DEPTH))
	$(info Screen height   : $(SCREEN_HEIGHT))
	$(info Screen res.     : $(SCREEN))
	$(info Screen width    : $(SCREEN_WIDTH))
	$(info TIFF format     : $(HAVE_TIFF_SUPPORT))
	$(info Update regions  : $(UPDATEREGIONS))
	$(info Verbose         : $(VERBOSE))
	$(info WinExtra        : $(WINEXTRA))
	$(info XPM format      : $(HAVE_XPM_SUPPORT))
