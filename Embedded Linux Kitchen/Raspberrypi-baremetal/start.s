// startup.S - Sets up the CPU and jumps to the main function.

.section .text
.global _start

_start:
    // Disable interrupts
    msr DAIFSet, #0xF

    // Set the stack pointer (SP)
    ldr x0, =stack_top
    mov sp, x0

    // Branch to main function
    bl main

    // Hang in an infinite loop
hang:
    wfe
    b hang

// Stack memory allocation
.section .bss
.align 4
stack:
    .space 0x1000 // Allocate 4KB stack
stack_top:

