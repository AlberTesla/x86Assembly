all : test.exe

test.exe : test.o test.c
	gcc -Wall test.c test.o -o test.exe

test.o : test.asm
	nasm -f elf test.asm -o test.o

prime1 : prime1.o prime.c
	gcc -Wall prime1.o prime.c -o test.exe

prime1.o : prime.asm
	nasm -f elf prime.asm -o prime1.o

prime : prime.o primeNumbers.c
	gcc -Wall primeNumbers.c test.o -o test.exe

prime.o : primeNumbers.asm
	nasm -f elf primeNumbers.asm -o test.o

list : test.asm
	nasm -f elf -l listing.txt test.asm

num : numbers.o numbers.c
	gcc -Wall numbers.c numbers.o -o test.exe

numbers.o : numbers.asm
	nasm -f elf numbers.asm

clean :
	del *.o *.exe *.txt