.PHONY: run clean compile all

BUILD_DIR = build
BINARY = main
SRC = src/main.c src/libds/queue.c 
INCLUDE_DIR = include
CC = gcc
CFLAGS = -I$(INCLUDE_DIR) -Wall -Wextra -O2

all: run

run: clean compile
	@./$(BUILD_DIR)/$(BINARY)

clean:
	@rm -rf $(BUILD_DIR)
	@echo "Cleaned build files."

compile: $(SRC)
	@mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) -o $(BUILD_DIR)/$(BINARY) $(SRC)

