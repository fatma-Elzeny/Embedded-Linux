/* linker.ld - Memory layout for Raspberry Pi 3 B+ */

SECTIONS
{
    /* Load address for the kernel (0x80000) */
    . = 0x80000;

    .text : {
        *(.text)
    }

    .rodata : {
        *(.rodata)
    }

    .data : {
        *(.data)
    }

    .bss : {
        *(.bss)
        . = ALIGN(4);
    }

    PROVIDE(end = .); /* Marks the end of the image */
}

