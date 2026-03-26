GCC = avr-gcc
OBJ-COPY = avr-objcopy
DUDE = avrdude

FILES = main.c

all: hex flash

# mmcu atmega328p = microcontrolador 
# -Os para que el codigo quepa en la memoria del avr
# -o (output) main elf para indicar que l oque salga se llamara main.elf
# -O ihex para especificar el tipo del salida
# microcontroladores avr tienen .text .data .eeprom, -R .eeprom para eliminar (remove) eeprom y solo llevar text y data
# -j .text -j .data es lo mismo pero al reves, solo incluye l oespecificado
hex:
	$(GCC) -mmcu=atmega328p -Os -o main.elf $(FILES)
	$(OBJ-COPY) -R .eeprom -O ihex main.elf main.hex

# -p (part number) modelo de microcontrolador
# -c (programmer) protocolo de comunicacion con el pc (cable usb fisico)
# -P (port) donde esta conectado el hardware (arduino)
# -U <memoria>:<operación>:<archivo>:<formato> memoria -> sector del chip flash (programa)
# operacion -> que hacer w (escribir), archivo -> main.hex, formato -> tipo de archivo i (intel hex)
flash:
	$(DUDE) -p atmega328p -c arduino -P /dev/ttyACM0 -U flash:w:main.hex:i

clean:
