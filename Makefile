# Makefile
.PHONY: all build run watch clean

# Variables
CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -Wpedantic
SRC_DIR = src
TARGET = program

all: build run

build:
	@$(CXX) $(CXXFLAGS) $(SRC_DIR)/main.cpp -o $(TARGET)

run:
	./$(TARGET)
	@echo "\n"

watch:
	@echo "Watching for changes in src/..."
	@$(MAKE) --no-print-directory build
	@$(MAKE) --no-print-directory run
	@while true; do \
		inotifywait -q -e modify,create,delete -r $(SRC_DIR) >/dev/null 2>&1; \
		$(MAKE) --no-print-directory build; \
		$(MAKE) --no-print-directory run; \
	done

clean:
	@rm -f $(TARGET)
