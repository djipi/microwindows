# Format selection (elf, aout, coff)
FORMAT = elf


# Assembler selection (smac, vasm, rmac)
ASM = vasm
# VASM information (madmac)
ifeq ($(ASM), vasm)
VASM_SUPPORT = madmac
endif
# Compiler C type (clang, gcc, vbcc)
COMPILER_C_TYPE	= gcc
# Compiler C version depend his type
COMPILER_C_VERSION = 5.5.0
# Compiler tools version depend his type
COMPILER_TOOLS_VERSION = 10.2.0
# Compiler selection based on type and version
COMPILER_C = $(COMPILER_C_TYPE)$(COMPILER_C_VERSION)
# Compiler selection based on type, and version
COMPILER_SELECT	= $(COMPILER_C_TYPE)-$(COMPILER_C_VERSION)
# Linker selection (jlinker, vlink, rln, sln)
LINKER_SELECT =	vlink


# Linker information
#
ifeq ($(LINKER_SELECT), vlink)
LNKProg = C:/VB/vlink0.17
else
ifeq ($(LINKER_SELECT), rln)
LNKProg = C:/AJaguar/RlnRmac/rln
else
ifeq ($(LINKER_SELECT), sln)
LNKProg = C:/AJaguar/SlnSmac/sln
else
ifeq ($(LINKER_SELECT),jlinker)
LNKProg = C:/AJaguar/Jlinker/jlinker
else
$(error LINKER_SELECT is not set or wrongly dispatched)
endif
endif
endif
endif


# ASM information
#
ifeq ($(ASM), vasm)
ASMProg	= C:/VB/Vasmm68k/vasmm68k_$(VASM_SUPPORT)_win32_1.9
else
ifeq ($(ASM), smac)
ASMProg	= C:/AJaguar/SlnSmac/smac
else
ifeq ($(ASM), rmac)
ASMProg	= C:/Tools/RmacRln/rmac
else
$(error ASM is not set or wrongly dispatched)
endif
endif
endif


# Tools information
TODOS = C:/Tools/tfd1713/todos
GSAR = C:/Tools/gsar


# C compiler & library information
#
# CLANG
#
ifeq ($(COMPILER_C_TYPE), clang)
# clang compiler
GCCMatch = yes
CCPATH = C:/LLVM/m68k-elf-clang-$(COMPILER_C_VERSION)
CCProg = C:/LLVM/m68k-elf-clang-$(COMPILER_C_VERSION)/bin/clang --target=m68k-none-$(FORMAT)
# gcc headers library
CCINC1 = C:/GNU/m68k-$(FORMAT)-gcc-4.9.3/m68k-$(FORMAT)/include
CCINC2 = C:/GNU/m68k-$(FORMAT)-gcc-4.9.3/lib/gcc/m68k-$(FORMAT)/4.9.3/include
#
# GCC
#
else
ifeq ($(COMPILER_C_TYPE), gcc)
# gcc compiler
GCCMatch = yes
ifneq ("$(wildcard C:/GNU/m68k-$(FORMAT)-gcc-$(COMPILER_C_VERSION)/bin)","")
CCPATH = C:/GNU/m68k-$(FORMAT)-gcc-$(COMPILER_C_VERSION)
CCProg = C:/GNU/m68k-$(FORMAT)-gcc-$(COMPILER_C_VERSION)/bin/m68k-$(FORMAT)-gcc -B$(CCPATH)/libexec/gcc/m68k-$(FORMAT)/$(COMPILER_C_VERSION)/ -B$(CCPATH)/m68k-$(FORMAT)/bin/
ARProg = C:/GNU/m68k-$(FORMAT)-gcc-$(COMPILER_TOOLS_VERSION)/bin/m68k-$(FORMAT)-ar
ARANProg = C:/GNU/m68k-$(FORMAT)-gcc-$(COMPILER_TOOLS_VERSION)/bin/m68k-$(FORMAT)-ranlib
readelf	= C:/GNU/m68k-$(FORMAT)-gcc-$(COMPILER_TOOLS_VERSION)/bin/m68k-$(FORMAT)-readelf
stripelf = C:/GNU/m68k-$(FORMAT)-gcc-$(COMPILER_TOOLS_VERSION)/bin/m68k-$(FORMAT)-strip
objdump = C:/GNU/m68k-$(FORMAT)-gcc-$(COMPILER_TOOLS_VERSION)/bin/m68k-$(FORMAT)-objdump
objcopy = C:/GNU/m68k-$(FORMAT)-gcc-$(COMPILER_TOOLS_VERSION)/bin/m68k-$(FORMAT)-objcopy
else
$(error COMPILER_C_VERSION is not set or wrongly dispatched)
endif
# gcc headers library
ifneq ("$(wildcard C:/GNU/m68k-$(FORMAT)-gcc-$(COMPILER_C_VERSION)/m68k-$(FORMAT)/include)","")
CCINC1 = C:/GNU/m68k-$(FORMAT)-gcc-$(COMPILER_C_VERSION)/m68k-$(FORMAT)/include
CCINC2 = C:/GNU/m68k-$(FORMAT)-gcc-$(COMPILER_C_VERSION)/lib/gcc/m68k-$(FORMAT)/$(COMPILER_C_VERSION)/include
else
CCINC1 = C:/GNU/m68k-$(FORMAT)-gcc-4.9.3/m68k-$(FORMAT)/include
CCINC2 = C:/GNU/m68k-$(FORMAT)-gcc-4.9.3/lib/gcc/m68k-$(FORMAT)/4.9.3/include
endif
# gcc libraries
ifneq ("$(wildcard C:/GNU/m68k-$(FORMAT)-gcc-$(COMPILER_C_VERSION)/lib/gcc/m68k-$(FORMAT)/$(COMPILER_C_VERSION)/mcpu32)", "")
DIRLIBGCC = C:/GNU/m68k-$(FORMAT)-gcc-$(COMPILER_C_VERSION)/lib/gcc/m68k-$(FORMAT)/$(COMPILER_C_VERSION)/mcpu32
DIRLIBC = C:/GNU/m68k-$(FORMAT)-gcc-$(COMPILER_C_VERSION)/m68k-$(FORMAT)/lib/mcpu32
else
DIRLIBGCC = C:/GNU/m68k-$(FORMAT)-gcc-4.9.3/lib/gcc/m68k-$(FORMAT)4.9.3/mcpu32
DIRLIBC = C:/GNU/m68k-$(FORMAT)-gcc-4.9.3/m68k-$(FORMAT)/lib/mcpu32
endif
#
# VBCC
#
else
ifeq ($(COMPILER_C_TYPE), vbcc)
# vbcc executables
CCPATH = C:/VB/vbcc$(COMPILER_C_VERSION)
CCProg = C:/VB/vbcc$(COMPILER_C_VERSION)/bin/vc +C:/VB/vbcc$(COMPILER_C_VERSION)/config/jaguar
#$(FORMAT)
# CCProg = C:/VB/vbcc$(COMPILER_C_VERSION)/bin/vbccm68k/
# ARProg = C:/GNU/m68k-elf-gcc-$(COMPILER_TOOLS_VERSION)/bin/m68k-elf-ar
# ARANProg = C:/GNU/m68k-elf-gcc-$(COMPILER_TOOLS_VERSION)/bin/m68k-elf-ranlib
objdump = c:/VB/vobjdump_win32_0.5.exe
readelf	= C:/GNU/m68k-$(FORMAT)-gcc-$(COMPILER_TOOLS_VERSION)/bin/m68k-$(FORMAT)-readelf
# vbcc headers library
# CCINC1 = C:/VB/vbcc$(COMPILER_C_VERSION)/targets/m68k-jaguar/include
# gcc libraries
DIRLIBC = C:/VB/vbcc$(COMPILER_C_VERSION)/targets/m68k-jaguar/lib
#
# Compiler not set
#
else
$(error COMPILER_C_TYPE is not set or wrongly dispatched)
endif
endif
endif
