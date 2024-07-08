BUILD_DIR=build
DISK=disk.img
bootloader=$(BUILD_DIR)/bootloader/load_os_from_mbr.bin
OS=$(BUILD_DIR)/os/sanOS.bin


all: bootdisk

.PHONY: all clean bootloader os

bootloader:
	make -C bootloader
os:
	make -C os

bootdisk: bootloader os
	dd if=/dev/zero of=$(DISK) bs=512 count=2880 
	dd conv=notrunc if=$(bootloader) of=$(DISK) bs=512 count=1 seek=0
	dd conv=notrunc if=$(OS) of=$(DISK) bs=512 count=1 seek=1

qemu:
	qemu-system-i386 -machine q35 -fda $(DISK) -gdb tcp::26000 -S

clean:
	make -C bootloader clean 
	make -C os clean 
	rm -rf $(BUILD_DIR) $(DISK)
