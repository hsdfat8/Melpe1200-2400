#   Make file for PairPhone
#   Tested with gcc 4.4.3 under Ubuntu 10.04 (requires libsound2-dev)
#   and MinGW (gcc 4.8.1, make 3.81) under Windows XP SP3


# Debugging options  
DEBUG = -O -DHEXDUMP

#Full duplex:

CC = gcc -Wall -g # for GNU's gcc compiler


#   Compiler flags

CFLAGS = $(DEBUG) $(PKOPTS) -Imeple $(CARGS) $(DUPLEX) $(CCFLAGS) $(DOMAIN)

BINARIES = main

PROGRAMS = $(BINARIES) $(SCRIPTS)

DIRS =  melpe

all:	$(PROGRAMS)

SPKROBJS = main.o


main: $(SPKROBJS) 
	$(CC) $(SPKROBJS)  melpe/libmelpe.a $(LFLAGS) -o melpe



#   Object file dependencies



main.o: Makefile main.c


#	Clean everything

clean:
	find . -name Makefile.bak -exec rm {} \;
	del -f core *.out *.o *.bak $(PROGRAMS) *.shar *.exe *.a
	@for I in $(DIRS); \
	  do (cd $$I; echo "==>Entering directory `pwd`"; $(MAKE) $@ || exit 1); done
	

# DO NOT DELETE