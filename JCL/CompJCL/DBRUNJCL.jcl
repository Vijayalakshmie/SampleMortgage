//USRDBRJ  JOB MSGLEVEL=(1,1),NOTIFY=&SYSUID                            00010001
//*                                                                     00020000
//**********************************************************************00030000
//* EXECUTE COBOL DB2 PROGRAM                                        ** 00040000
//**********************************************************************00050000
//STEP01   EXEC PGM=IKJEFT01,                                           00060000
//             DYNAMNBR=20,REGION=4096K                                 00070000
//STEPLIB  DD  DISP=SHR,DSN=DSND10.DBDG.SDSNEXIT                        00080000
//         DD  DISP=SHR,DSN=DSND10.SDSNLOAD                             00090000
//SYSPRINT DD  SYSOUT=*                                                 00100000
//SYSTSPRT DD  SYSOUT=*                                                 00110000
//SYSUDUMP DD  SYSOUT=*                                                 00120000
//SYSTSIN  DD  *                                                        00130000
DSN SYSTEM (DBDG   )                                                    00140000
  RUN PROGRAM   (STUDTEST) -                                            00150000
      PLAN      (ADCDBPL)  -                                            00160000
      LIBRARY   ('ADCDB.LOADLIB')                                       00170000
END                                                                     00180000
/*                                                                      00190000