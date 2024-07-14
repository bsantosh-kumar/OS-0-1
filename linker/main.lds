ENTRY(main)
PHDRS{
	null PT_NULL FILEHDR;
	code PT_LOAD;
}

SECTIONS
{
. = 0x10000;
.text : { *(.text) } : code
. = 0x8000000; 
.data : { *(.data) }
.bss : { *(.bss) }
}
