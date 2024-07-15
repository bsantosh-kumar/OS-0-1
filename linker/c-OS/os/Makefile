BUILD_DIR=../build/os
OS:=$(BUILD_DIR)/os

OS_SRCS:=$(wildcard *.c)
OS_OBJS:=$(patsubst %.c, $(BUILD_DIR)/%.o, $(OS_SRCS))

CFLAGS+=-ffreestanding -nostdlib -gdwarf-4 -m32 -ggdb3 -masm=intel

all: $(OS)

$(BUILD_DIR)/%.o: %.c $(BUILD_DIR)
	gcc $(CFLAGS) -c $< -o $@

$(BUILD_DIR):
	mkdir -p $@

$(OS): $(OS_OBJS)
	ld -m elf_i386 -nmagic -T os.lds $^ -o $@

clean:
	rm -rf $(OS_OBJS)
