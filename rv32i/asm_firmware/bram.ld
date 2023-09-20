MEMORY
{
   BRAM (RWX) : ORIGIN = 0x0000, LENGTH = 0x1000  /* 6kB RAM */
}
SECTIONS
{
    everything :
    {
	. = ALIGN(4);
	main.o (.text)
        *(.*)
    } >BRAM
}

