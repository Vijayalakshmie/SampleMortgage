//* PLEASE CHANGE PLAN,MEMBER,OWNER,LIB                                 00010003
//* CHANGE THE PLAN ADCDA01P TO USER PLAN                               00020003
//USRCDBCJ JOB MSGLEVEL=(1,1),NOTIFY=&SYSUID                            00030003
// JCLLIB  ORDER=ADCD.PROCLIB                                           00040003
//STEP01   EXEC PROC=CICSDB,WSPC=500,                                   00050003
//           MEM=ADCDB01P,USER=ADCDB,MAP=CRDTYP                         00060003
//TRN.SYSIN  DD   DISP=SHR,DSN=&USER..COBCICS.SRCLIB(&MEM)              00070003
//PC.DBRMLIB DD   DISP=SHR,DSN=&USER..DBRMLIB(&MEM)                     00080003
//PC.SYSLIB  DD   DISP=SHR,DSN=&USER..DCLLIB                            00090003
//COB.SYSLIB DD  DISP=SHR,DSN=&USER..CICS.SYMAPLIB(&MAP)                00100003
//LKED.SYSLMOD DD  DISP=SHR,DSN=DFH610.CICS.PRGLOAD(&MEM)               00110003
//LKED.SYSIN DD *                                                       00120003
//* CHANGE THE PLAN ADCD*01P TO USER PLAN                               00130003
  INCLUDE SYSLIB(DSNCLI)                                                00140003
  NAME ADCDB01P (R)                                                     00150003
/*                                                                      00160003
//*                                                                     00170003
//BIND    EXEC PGM=IKJEFT01,DYNAMNBR=20,COND=(4,LT)                     00180003
//STEPLIB        DD  DISP=SHR,DSN=DSND10.SDSNLOAD                       00190003
//SYSTSPRT       DD  SYSOUT=(*)                                         00200003
//SYSTSIN        DD  *                                                  00210003
//* PLEASE CHANGE PLAN,MEMBER,OWNER,LIB                                 00220003
        DSN SYSTEM(DBDG)                                                00230004
        BIND PLAN(ADCDBPL)-                                             00240003
        MEMBER(ADCDB01P) -                                              00250003
        VALIDATE(BIND) -                                                00260003
        ISOLATION(CS) -                                                 00270003
        RELEASE(C) -                                                    00280003
        EXPLAIN(NO)-                                                    00290003
        OWNER(IBMUSER)-                                                 00300003
        LIB('ADCD.DBRMLIB')                                             00310003
/*                                                                      00320003
//                                                                      00330003