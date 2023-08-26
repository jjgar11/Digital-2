MEMORY
{
   BRAM (RWX) : ORIGIN = 0x0000, LENGTH = 0x400  /* 6kB RAM */
}
SECTIONS
{
    everything :
    {
	. = ALIGN(4);
	multiplier.o (.text)
        *(.*)
    } >BRAM
}

