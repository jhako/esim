#
# Cross Platform Makefile
# Compatible with MSYS2/MINGW, Ubuntu 14.04.1 and Mac OS X
#
# You will need GLFW (http://www.glfw.org):
# Linux:
#   apt-get install libglfw-dev
# Mac OS X:
#   brew install glfw
# MSYS2:
#   pacman -S --noconfirm --needed mingw-w64-x86_64-toolchain mingw-w64-x86_64-glfw
#

CXX = x86_64-w64-mingw32-clang++
CC = x86_64-w64-mingw32-clang

STLIB = libimgui_glfw.a
SOURCES = ../../imgui_impl_glfw.cpp ../../imgui_impl_opengl3.cpp
SOURCES += ../../../imgui.cpp ../../../imgui_demo.cpp ../../../imgui_draw.cpp ../../../imgui_widgets.cpp
OBJS = $(addsuffix .o, $(basename $(notdir $(SOURCES))))

CXXFLAGS = -I../../ -I../../../
CXXFLAGS += -g -Wall -Wformat
LIBS =

##---------------------------------------------------------------------
## OPENGL LOADER
##---------------------------------------------------------------------

## Using OpenGL loader: gl3w [default]
SOURCES += ../../libs/gl3w/GL/gl3w.c
CXXFLAGS += -I../../libs/gl3w -DIMGUI_IMPL_OPENGL_LOADER_GL3W

ECHO_MESSAGE = "Linux"
LIBS += -lopengl32 `pkg-config --static --libs glfw3`
LIBS += -static -lstdc++ -lgcc

CXXFLAGS += `pkg-config --cflags glfw3`
CFLAGS = $(CXXFLAGS)

##---------------------------------------------------------------------
## BUILD RULES
##---------------------------------------------------------------------

#%.o:%.cpp
#	$(CXX) $(CXXFLAGS) -c -o $@ $<

%.o:../../%.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

%.o:../../../%.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

%.o:../../libs/gl3w/GL/%.c
	$(CC) $(CFLAGS) -c -o $@ $<

#%.o:../libs/glad/src/%.c
#	$(CC) $(CFLAGS) -c -o $@ $<

all: $(STLIB)
	@echo Build complete

$(STLIB): $(OBJS)
	ar rcs $@ $^

clean:
	rm -f $(STLIB) $(OBJS)
