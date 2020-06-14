
CXX = x86_64-w64-mingw32-clang++

TARGET = ./bin/esim.exe

SRCS = $(wildcard src/*.cpp)

CXXFLAGS = -g -MMD -MP -Wall -Wextra
INCS =
LIBS = 

OBJS = $(addprefix obj/, $(notdir $(SRCS:.cpp=.o)))
DEPS = $(OBJS:.o=.d)

# IMGUI
INCS += -I./lib/imgui_glfw_static/include
LIBS += ./lib/imgui_glfw_static/lib/libimgui_glfw.a

# GLFW
LIBS += -lopengl32 `pkg-config --static --libs glfw3`
CXXFLAGS += `pkg-config --cflags glfw3` 

# MINGW
LIBS += -static -lstdc++ -lgcc

$(TARGET): $(OBJS)
	$(CXX) -o $@ $^ $(LIBS)

obj/%.o: src/%.cpp
	-mkdir -p obj
	$(CXX) $(CXXFLAGS) $(INCS) -o $@ -c $<

all: clean $(TARGET)

run: $(TARGET)
	./$(TARGET)

clean:
	-rm -f $(OBJS) $(DEPS) $(TARGET)

-include $(DEPS)
