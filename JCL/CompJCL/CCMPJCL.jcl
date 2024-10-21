//USRCCMPJ JOB REGION=0M,NOTIFY=&SYSUID                                 00010003
//**********************************************************************00020000
//*                           INPUT AREA                               *00030000
//**********************************************************************00040000
//  SET MEMBER='HELLO'                           <== YOUR   MEMBER NAME 00050000
//  SET SOURCE='ADCD.COBOL.SRCLIB'               <== YOUR COBOL LIBRARY 00060000
//  SET COPYLIB='ADCD.COBOL.COPYLIB'             <== YOUR  COPY LIBRARY 00070000
//  SET LOADLIB='ADCD.LOADLIB'                   <== YOUR  LOAD LIBRARY 00080000
//  SET LNGPRFX='IGY640'                                                00082000
//  SET LIBPRFX='CEE'                                                   00083000
//**********************************************************************00090000
//*                   COMPILE THE COBOL PROGRAM                        *00100000
//**********************************************************************00110000
//COBCOMP EXEC PGM=IGYCRCTL,REGION=0M                                   00120002
//STEPLIB  DD  DSNAME=&LNGPRFX..SIGYCOMP,DISP=SHR                       00130000
//         DD  DSNAME=&LIBPRFX..SCEERUN,DISP=SHR                        00140000
//         DD  DSNAME=&LIBPRFX..SCEERUN2,DISP=SHR                       00150000
//SYSIN    DD  DSNAME=&SOURCE(&MEMBER),DISP=SHR                         00151000
//SYSLIB   DD  DSNAME=&COPYLIB,DISP=SHR                                 00152000
//SYSPRINT DD  SYSOUT=*                                                 00160000
//SYSLIN   DD  DSNAME=&&LOADSET,UNIT=SYSALLDA,                          00170000
//             DISP=(MOD,PASS),SPACE=(CYL,(1,1)),VOL=(,,,1)             00180000
//SYSUT1   DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1)),VOL=(,,,1)               00190000
//SYSUT2   DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1)),VOL=(,,,1)               00200000
//SYSUT3   DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1)),VOL=(,,,1)               00210000
//SYSUT4   DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1)),VOL=(,,,1)               00220000
//SYSUT5   DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1)),VOL=(,,,1)               00230000
//SYSUT6   DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1)),VOL=(,,,1)               00240000
//SYSUT7   DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1)),VOL=(,,,1)               00250000
//SYSUT8   DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1)),VOL=(,,,1)               00260000
//SYSUT9   DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1)),VOL=(,,,1)               00261000
//SYSUT10  DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1)),VOL=(,,,1)               00262000
//SYSUT11  DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1)),VOL=(,,,1)               00263000
//SYSUT12  DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1)),VOL=(,,,1)               00264000
//SYSUT13  DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1)),VOL=(,,,1)               00265000
//SYSUT14  DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1)),VOL=(,,,1)               00266000
//SYSUT15  DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1)),VOL=(,,,1)               00267000
//SYSMDECK DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1)),VOL=(,,,1)               00268000
//**********************************************************************00268100
//*                   LINK EDIT THE COBOL PROGRAM                      *00268200
//**********************************************************************00268300
//LINKEDIT EXEC PGM=IEWL,COND=(4,LT,COBCOMP)                            00268402
//SYSLIB   DD  DSNAME=&LIBPRFX..SCEELKEX,DISP=SHR                       00268502
//         DD  DSNAME=&LIBPRFX..SCEELKED,DISP=SHR                       00268602
//SYSLIN   DD DSN=&&LOADSET,DISP=(OLD,DELETE)                           00268902
//         DD DDNAME=SYSIN                                              00269002
//SYSLMOD  DD DISP=SHR,DSN=&LOADLIB(&MEMBER)                            00269102
//SYSPRINT DD SYSOUT=*                                                  00269202
//SYSUDUMP DD SYSOUT=*                                                  00269302
//SYSUT1   DD SPACE=(1043,(50,50)),UNIT=SYSDA                           00269402