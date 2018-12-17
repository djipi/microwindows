##############################################################################
# Microwindows template Makefile
# Copyright (c) 2000 Martin Jolicoeur, Greg Haerr
##############################################################################

ifndef MW_DIR_SRC
MW_DIR_SRC := $(CURDIR)/../..
endif
MW_DIR_RELATIVE := demos/nbreaker/
include $(MW_DIR_SRC)/Path.rules
include $(CONFIG)

ifeq ($(NANOX), Y)
ifeq ($(NANOXDEMO), Y)

######################## Additional Flags section ############################

# Directories list for header files
INCLUDEDIRS +=
# Defines for preprocessor
DEFINES +=

# Compilation flags for C files OTHER than include directories
CFLAGS +=
# Preprocessor flags OTHER than defines
CPPFLAGS +=
# Linking flags
LDFLAGS += -lm

############################# targets section ################################

# If you want to create a library with the objects files, define the name here
LIBNAME =

# List of objects to compile
OBJS := \
	$(MW_DIR_OBJ)/demos/nbreaker/animate.o \
	$(MW_DIR_OBJ)/demos/nbreaker/ball.o \
	$(MW_DIR_OBJ)/demos/nbreaker/bat.o \
	$(MW_DIR_OBJ)/demos/nbreaker/brick.o \
	$(MW_DIR_OBJ)/demos/nbreaker/cheat.o \
	$(MW_DIR_OBJ)/demos/nbreaker/draw.o \
	$(MW_DIR_OBJ)/demos/nbreaker/dump.o \
	$(MW_DIR_OBJ)/demos/nbreaker/event.o \
	$(MW_DIR_OBJ)/demos/nbreaker/game.o \
	$(MW_DIR_OBJ)/demos/nbreaker/init.o \
	$(MW_DIR_OBJ)/demos/nbreaker/levels.o \
	$(MW_DIR_OBJ)/demos/nbreaker/loader.o \
	$(MW_DIR_OBJ)/demos/nbreaker/misc.o \
	$(MW_DIR_OBJ)/demos/nbreaker/nbreaker.o \
	$(MW_DIR_OBJ)/demos/nbreaker/powers.o \
	$(MW_DIR_OBJ)/demos/nbreaker/scores.o \
	$(MW_DIR_OBJ)/demos/nbreaker/sprite.o \

ifeq ($(ARCH), ECOS)
TARGET = $(MW_DIR_BIN)/nbreaker.o
else
TARGET = $(MW_DIR_BIN)/nbreaker
endif

all: default $(TARGET)

######################### Makefile.rules section #############################

include $(MW_DIR_SRC)/Makefile.rules

######################## Tools targets section ###############################

ifeq ($(SHAREDLIBS), Y)
$(MW_DIR_SRC)/bin/nbreaker: $(OBJS) $(NANOXCLIENTLIBS) $(MW_DIR_SRC)/config
	$(CC) $(CFLAGS) $(LDFLAGS) $(OBJS) -o $@ $(CCNANOXCLIENTLIBS)
else
$(MW_DIR_SRC)/bin/nbreaker: $(OBJS) $(NANOXCLIENTLIBS) $(MW_DIR_SRC)/config
	$(CC) $(CFLAGS) $(LDFLAGS) $(OBJS) -o $@ $(NANOXCLIENTLIBS)
endif

endif
endif