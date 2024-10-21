//USRCICRJ JOB MSGLEVEL=(1,1),NOTIFY=&SYSUID                            00001004
// JCLLIB ORDER=ADCD.PROCLIB                                            00010002
//STEP01  EXEC PROC=BMPPROC,MEM=HELLO,USER=ADCD                         00020003
//C.SYSIN DD DSN=&USER..CICS.MAPLIB(&MEM),DISP=SHR                      00030002
//L.SYSLMOD DD DSN=DFH610.CICS.PRGLOAD(&MEM),DISP=SHR                   00040003
//CSYM.SYSIN DD DSN=&USER..CICS.MAPLIB(&MEM),DISP=SHR                   00051003
//CSYM.SYSLIN DD DSN=&USER..CICS.SYMAPLIB(&MEM),DISP=SHR                00060003
//                                                                      00070000