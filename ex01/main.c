#define F_CPU 16000000UL
#include <avr/io.h>
#include <util/delay.h>

int main(void)
{
	DDRB |= (1 << PB5); // set PB5 as output pin
    
    while (1) {
        
        //PORTB |= (1<< PORTB5);
        PINB |= (1 << PINB5);
       
       _delay_ms(100);
    }
}