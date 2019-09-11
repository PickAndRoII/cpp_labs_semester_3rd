OUTPUT = program

CXX=g++
CXXFLAGS+=-Wall -O0 $(GXX_FLAGS) -std=c++11
CXXFLAGS+=-g

DEP_FLAGS=-MMD
DEP_FLAGS+=-MP

SRC=$(wildcard *.cpp)
OBJ=$(SRC:.cpp=.o)
DEP=${SRC:.cpp=.d}

CXXFLAGS+=$(DEP_FLAGS)

all: $(OUTPUT)
	@echo Cel glowny zbudowany

$(OUTPUT): $(OBJ)
	@$(CXX) $(OBJ) -o $@
	
%.o: %.cpp
	@$(CXX) -c $(CXXFLAGS) $<


.PHONY: clean run memcheck

clean:
	@rm -f program $(OBJ) *.d

run: program
	./program

memcheck: program
	valgrind ./program

-include $(DEP) 
