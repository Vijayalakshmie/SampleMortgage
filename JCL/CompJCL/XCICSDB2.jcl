//ADCDBCCJ JOB MSGLEVEL=(1,1),NOTIFY=&SYSUID,REGION=0M                  00010000
// JCLLIB  ORDER=ADCD.PROCLIB                                           00020000
//STEP01   EXEC PROC=CICSDB,WSPC=500,MEM=ADCDB01P,USER=ADCDB            00030000
//TRN.SYSIN  DD   DISP=SHR,DSN=&USER..COBCICS.SRCLIB(&MEM)              00040000
//PC.DBRMLIB DD   DISP=SHR,DSN=&USER..DBRMLIB(&MEM)                     00050000
//PC.SYSLIB  DD   DISP=SHR,DSN=&USER..DCLLIB                            00060000
//COB.SYSLIB DD  DISP=SHR,DSN=&USER..CICS.SYMAPLIB(ADCDB01)             00070000
//LKED.SYSLMOD DD  DISP=SHR,DSN=DFH610.CICS.PRGLOAD(&MEM)               00080000
//LKED.SYSIN DD *                                                       00090000
//* CHANGE THE PLAN ADCDA01P TO USER PLAN                               00100000
  INCLUDE SYSLIB(DSNCLI)                                                00110000
  NAME ADCDB01P(R)                                                      00120000
/*                                                                      00130000
//*                                                                     00140000
//BIND    EXEC PGM=IKJEFT01,DYNAMNBR=20,COND=(4,LT)                     00150000
//STEPLIB        DD  DISP=SHR,DSN=DSND10.SDSNLOAD                       00160000
//SYSTSPRT       DD  SYSOUT=(*)                                         00170000
//SYSTSIN        DD  *                                                  00180000
//* PLEASE CHANGE PLAN,MEMBER,OWNER,LIB                                 00190000
        DSN SYSTEM(DDAG)                                                00200000
        BIND PLAN(ADCDB01P) -                                           00210000
        MEMBER(ADCDB01P) -                                              00220000
        VALIDATE(BIND) -                                                00230000
        ISOLATION(CS) -                                                 00240000
        RELEASE(C) -                                                    00250000
        EXPLAIN(NO)-                                                    00260000
        OWNER(IBMUSER)-                                                 00270000
        LIB('ADCD.DBRMLIB')                                             00280000
/*                                                                      00290000