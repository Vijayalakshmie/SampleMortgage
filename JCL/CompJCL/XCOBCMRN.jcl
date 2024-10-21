//USRCCMRJ JOB REGION=0M,NOTIFY=&SYSUID                                 00010002
//**********************************************************************00020000
//*                           INPUT AREA                               *00030000
//**********************************************************************00040000
//  SET MEMBER='HELLO'                           <== YOUR   MEMBER NAME 00050000
//  SET SOURCE='ADCD.COBOL.SRCLIB'               <== YOUR COBOL LIBRARY 00060000
//  SET COPYLIB='ADCD.COBOL.COPYLIB'             <== YOUR  COPY LIBRARY 00070000
//  SET LOADLIB='ADCD.LOADLIB'                   <== YOUR  LOAD LIBRARY 00080000
//  SET LNGPRFX='IGY640'                                                00090000
//  SET LIBPRFX='CEE'                                                   00100000
//**********************************************************************00110000
//*                   COMPILE THE COBOL PROGRAM                        *00120000
//**********************************************************************00130000
//COBOL  EXEC PGM=IGYCRCTL,REGION=0M                                    00140000
//STEPLIB  DD  DSNAME=&LNGPRFX..SIGYCOMP,DISP=SHR                       00150000
//         DD  DSNAME=&LIBPRFX..SCEERUN,DISP=SHR                        00160000
//         DD  DSNAME=&LIBPRFX..SCEERUN2,DISP=SHR                       00170000
//SYSIN    DD  DSNAME=&SOURCE(&MEMBER),DISP=SHR                         00180000
//SYSLIB   DD  DSNAME=&COPYLIB,DISP=SHR                                 00190000
//SYSPRINT DD  SYSOUT=*                                                 00200000
//SYSLIN   DD  DSNAME=&&LOADSET,UNIT=SYSALLDA,                          00210000
//             DISP=(MOD,PASS),SPACE=(CYL,(1,1)),VOL=(,,,1)             00220000
//SYSUT1   DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1)),VOL=(,,,1)               00230000
//SYSUT2   DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1)),VOL=(,,,1)               00240000
//SYSUT3   DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1)),VOL=(,,,1)               00250000
//SYSUT4   DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1)),VOL=(,,,1)               00260000
//SYSUT5   DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1)),VOL=(,,,1)               00270000
//SYSUT6   DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1)),VOL=(,,,1)               00280000
//SYSUT7   DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1)),VOL=(,,,1)               00290000
//SYSUT8   DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1)),VOL=(,,,1)               00300000
//SYSUT9   DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1)),VOL=(,,,1)               00310000
//SYSUT10  DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1)),VOL=(,,,1)               00320000
//SYSUT11  DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1)),VOL=(,,,1)               00330000
//SYSUT12  DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1)),VOL=(,,,1)               00340000
//SYSUT13  DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1)),VOL=(,,,1)               00350000
//SYSUT14  DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1)),VOL=(,,,1)               00360000
//SYSUT15  DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1)),VOL=(,,,1)               00370000
//SYSMDECK DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1)),VOL=(,,,1)               00380000
//**********************************************************************00390000
//*                   LINK EDIT THE COBOL PROGRAM                      *00400000
//**********************************************************************00410000
//LKED   EXEC PGM=IEWBLINK,COND=(8,LT,COBOL),REGION=0M                  00420000
//SYSLIB   DD  DSNAME=&LIBPRFX..SCEELKEX,DISP=SHR                       00430000
//         DD  DSNAME=&LIBPRFX..SCEELKED,DISP=SHR                       00440000
//SYSPRINT DD  SYSOUT=*                                                 00450000
//SYSLIN   DD  DSNAME=&&LOADSET,DISP=(OLD,DELETE)                       00460000
//         DD  DDNAME=SYSIN                                             00470000
//SYSLMOD  DD  DSNAME=&&LOADLIB(&MEMBER),SPACE=(CYL,(1,1,1)),           00480000
//             UNIT=SYSALLDA,DISP=(MOD,PASS),DSNTYPE=LIBRARY            00490000
//GO     EXEC PGM=*.LKED.SYSLMOD,COND=((8,LT,COBOL),(4,LT,LKED)),       00500000
//             REGION=0M                                                00510000
//STEPLIB  DD  DSNAME=&LIBPRFX..SCEERUN,DISP=SHR                        00520000
//         DD  DSNAME=&LIBPRFX..SCEERUN2,DISP=SHR                       00530000
//SYSPRINT DD  SYSOUT=*                                                 00540000
//CEEDUMP  DD  SYSOUT=*                                                 00550000
//SYSUDUMP DD  SYSOUT=*                                                 00560000