CC = avr-gcc
CFLAGS = -mmcu=atmega328p
PORT = /dev/ttyACMO
FILE_NAME = baremetal


baremetal.hex: baremetal
	avr-objcopy -O ihex -R .eeprom baremetal baremetal.hex

baremetal: baremetal.o
	$(CC) $(CFLAGS) -o baremetal baremetal.o

baremetal.o: baremetal.c
	$(CC) $(CFLAGS) -Os -D F_CPU=16000000UL -c -o baremetal.o baremetal.c


clean:
	rm -rf *.o *.hex baremetal

