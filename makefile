
BIN_LIB=CMPSYS
LIBLIST=$(BIN_LIB) CLV1
SHELL=/QOpenSys/usr/bin/qsh

all: test20.rpgle

%.rpgle:
	system -s "CHGATR OBJ('/home/CLV/test20/qrpglesrc/$*.rpgle') ATR(*CCSID) VALUE(1252)"
	liblist -a $(LIBLIST);\
	system "CRTBNDRPG PGM($(BIN_LIB)/$*) SRCSTMF('/home/CLV/test20/qrpglesrc/$*.rpgle') DBGVIEW(*SOURCE) OPTION(*EVENTF)"
