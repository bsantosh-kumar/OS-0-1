To compile to bootloader use:
```
nasm -f bin bootloader.asm -o bootloader
```

To create a floppy disk:
```
dd if=/dev/zero of=disk.img bs=512 count=2880
```

To write bootloader to disk use:
```
dd conv=notrunc if=bootloader of=disk.img bs=512 count=1 seek=0
```
