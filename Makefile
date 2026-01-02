CXX := g++
CXXFLAGS := -O2 -Wall -Wextra -std=c++17 -fPIC

PYTHON := python3
PY_INC := $(shell $(PYTHON)-config --includes)
PY_LIBS := $(shell $(PYTHON)-config --ldflags)
PY_SUFFIX := $(shell $(PYTHON)-config --extension-suffix)

PYBIND11_INC := $(shell python3 -m pybind11 --includes 2>/dev/null || echo "-I/usr/include")

SFML_LIBS := -lsfml-graphics -lsfml-window -lsfml-system -lX11 -lXrandr -lXcursor -lXrender -lXext -lXfixes -lGL

TARGET := Viper$(PY_SUFFIX)
SRC := Viper.cpp

all: $(TARGET)

$(TARGET): $(SRC)
	$(CXX) $(CXXFLAGS) $(PY_INC) $(PYBIND11_INC) \
		$^ -shared -o $@ $(PY_LIBS) $(SFML_LIBS)

clean:
	rm -f $(TARGET)
