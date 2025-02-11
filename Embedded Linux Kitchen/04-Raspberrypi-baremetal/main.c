#define GPIO_BASE 0x3F200000 // For Raspberry Pi 3/4. Adjust for other models.
#define GPFSEL1    (GPIO_BASE + 0x04)
#define GPSET0     (GPIO_BASE + 0x1C)
#define GPCLR0     (GPIO_BASE + 0x28)
#define LED_PIN    18

void delay(unsigned int count) {
    while (count--) {
        asm volatile("nop");
    }
}

void main() {
    volatile unsigned int* gpio_fsel = (unsigned int*)GPFSEL1;
    volatile unsigned int* gpio_set = (unsigned int*)GPSET0;
    volatile unsigned int* gpio_clr = (unsigned int*)GPCLR0;

    // Set GPIO18 as output
    *gpio_fsel = (*gpio_fsel & ~(0x7 << 24)) | (0x1 << 24);

    while (1) {
        // Turn LED on
        *gpio_set = (1 << LED_PIN);
        delay(1000000);

        // Turn LED off
        *gpio_clr = (1 << LED_PIN);
        delay(1000000);
    }
}

