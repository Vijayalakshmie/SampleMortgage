//ADCD1 JOB ,
// MSGCLASS=H,MSGLEVEL=(1,1),TIME=(,4),REGION=144M,COND=(16,LT)
//*
//        SET FELJOB=CMP
//STP0000 EXEC PROC=ELAXFCOC,
// CICS=,
// DB2=,
// COMP=
//COBOL.SYSDEBUG DD DISP=SHR,
//        DSN=ADCD.COBOL.SYSDEBUG(HELLO)
//COBOL.SYSLIN DD DISP=SHR,
//        DSN=ADCD.COBOBJS.OBJ(HELLO)
//COBOL.SYSLIB DD DISP=SHR,
//        DSN=ADCD.COBOL.COPYLIB
//COBOL.SYSXMLSD DD DUMMY
//COBOL.SYSIN DD DISP=SHR,
//        DSN=ADCD.COBOL.SRCLIB(HELLO)
//*
//******* ADDITIONAL JCL FOR COMPILE HERE ******
//