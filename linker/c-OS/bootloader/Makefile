BUILD_DIR=../build/bootloader
BOOTLOADER_SRCS:=$(wildcard *.asm)
BOOTLOADER_OBJS:=$(patsubst %.asm, $(BUILD_DIR)/%.o, $(BOOTLOADER_SRCS))
BOOTLOADER_BINS:=$(patsubst %.asm, $(BUILD_DIR)/%.bin, $(BOOTLOADER_SRCS))

$(warning OBJS is $(BOOTLOADER_BINS))
.PRECIOUS: $(BUILD_DIR)/%.bin $(BUILD_DIR)/%.o.elf

all: $(BOOTLOADER_BINS)

$(BUILD_DIR)/%.bin: $(BUILD_DIR)/%.o.elf
	objcopy -O binary $< $@

$(BUILD_DIR)/%.o: %.asm $(BUILD_DIR)
	nasm -f elf -F dwarf -g $< -o $@
	
$(BUILD_DIR)/%.o.elf: $(BUILD_DIR)/%.o
	ld -m elf_i386 -T bootloader.lds $< -o $@

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

clean:
	rm -rf $(BUILD_DIR)
