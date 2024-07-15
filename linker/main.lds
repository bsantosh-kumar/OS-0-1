ENTRY(main)
PHDRS{
	null PT_NULL ;
	code PT_LOAD FILEHDR AT(0x500);
}

SECTIONS
{
. = 0x10000;
.text : { *(.text) } : code 
. = 0x8000000; 
.data : { *(.data) }
.bss : { *(.bss) }
}
