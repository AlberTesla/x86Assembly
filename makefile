all : test.exe

test.exe : test.o driver.c
	gcc -Wall driver.c test.o -o test.exe

test.o : test.asm
	nasm -f elf test.asm -o test.o

list : test.asm
	nasm -f elf -l listing.txt test.asm

clean :
	del *.o *.exe *.txt