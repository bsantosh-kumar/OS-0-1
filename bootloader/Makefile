all: bootloader kernel 

.PHONY: bootloader bootdisk clean all
bootloader: 
	nasm -f bin load_os_from_mbr.asm -o load_os_from_mbr.bin

kernel: 
	nasm  -f bin sanOS.asm -o sanOS.bin


bootdisk: bootloader kernel
	dd if=/dev/zero of=disk.img bs=512 count=2880 
	dd conv=notrunc if=load_os_from_mbr.bin of=disk.img bs=512 count=1 seek=0
	dd conv=notrunc if=sanOS.bin of=disk.img bs=512 count=1 seek=1


clean:
	rm -f *.bin 
