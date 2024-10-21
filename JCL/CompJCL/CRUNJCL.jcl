//USRCRUNJ JOB MSGLEVEL=(1,1),NOTIFY=&SYSUID                            00001001
//*                                                                     00002000
// SET PGMNAME=HELLO                                                    00003000
//*                                                                     00005000
// SET LOADLIB=ADCD.LOADLIB                                             00006000
//**********************************************************************00010000
//* EXECUTE COBOL PROGRAM                                            ** 00020000
//**********************************************************************00030000
//STEP01   EXEC PGM=&PGMNAME                                            00040000
//STEPLIB  DD DSN=&LOADLIB,DISP=SHR                                     00050000
//SYSPRINT DD SYSOUT=*                                                  00130000
//SYSOUT   DD SYSOUT=*                                                  00141000
//***************END OF JOB*********************************************00150000