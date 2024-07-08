DISK=disk.img
bootloader=load_os_from_mbr.bin
OS=sanOS.bin

BOOTLOADER_SRCS := $(wildcard *.asm)
BOOTLOADER_OBJS := $(patsubst %.asm, %.bin, $(BOOTLOADER_SRCS))

all: bootdisk

.PHONY: all clean

%.bin: %.asm
	nasm -f bin $< -o $@

bootdisk: $(BOOTLOADER_OBJS)
	dd if=/dev/zero of=$(DISK) bs=512 count=2880 
	dd conv=notrunc if=$(bootloader) of=$(DISK) bs=512 count=1 seek=0
	dd conv=notrunc if=$(OS) of=$(DISK) bs=512 count=1 seek=1


clean:
	rm -f *.bin 
