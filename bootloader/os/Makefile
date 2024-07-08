BUILD_DIR=../build/os
OS_SRCS = $(wildcard *.asm)
OS_OBJS = $(patsubst %.asm, $(BUILD_DIR)/%.bin, $(OS_SRCS))

all:$(OS_OBJS)

$(BUILD_DIR)/%.bin:%.asm $(BUILD_DIR) 
	nasm -f bin $< -o $@

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)
clean:
	rm -rf $(BUILD_DIR)

