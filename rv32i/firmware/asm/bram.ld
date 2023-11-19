MEMORY
{
   BRAM (RWX) : ORIGIN = 0x0000, LENGTH = 0x2000  /* 6kB RAM */
}
SECTIONS
{
    everything :
    {
	. = ALIGN(4);
	test_screen.o (.text)
        *(.*)
    } >BRAM
}

