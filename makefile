
BIN_LIB=CMPSYS
LIBLIST=$(BIN_LIB) CLV1
SHELL=/QOpenSys/usr/bin/qsh

all: test20.rpgle

test20.rpgle: test20.dspf

%.rpgle:
	system -s "CHGATR OBJ('/home/CLV/test20/qrpglesrc/$*.rpgle') ATR(*CCSID) VALUE(1252)"
	liblist -a $(LIBLIST);\
	system "CRTBNDRPG PGM($(BIN_LIB)/$*) SRCSTMF('/home/CLV/test20/qrpglesrc/$*.rpgle') DBGVIEW(*SOURCE) OPTION(*EVENTF)"

%.dspf:
	-system -qi "CRTSRCPF FILE($(BIN_LIB)/QDDSSRC) RCDLEN(112)"
	system "CPYFRMSTMF FROMSTMF('/home/CLV/test20/qddssrc/$*.dspf') TOMBR('/QSYS.lib/$(BIN_LIB).lib/QDDSSRC.file/$*.mbr') MBROPT(*REPLACE)"
	system -s "CRTDSPF FILE($(BIN_LIB)/$*) SRCFILE($(BIN_LIB)/QDDSSRC) SRCMBR($*)"
