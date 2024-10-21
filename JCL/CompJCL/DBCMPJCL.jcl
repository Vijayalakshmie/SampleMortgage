//USRDBCJ  JOB REGION=0M,NOTIFY=&SYSUID                                 00010009
//********************************************************************  00020008
//*        DSNHICOB  - DB2 precompile, IBM COBOL compile, pre-link,  *  00030008
//*                    and link edit a DB2 SQL program.              *  00040008
//********************************************************************  00050008
// SET MEM=STUDTEST,USER=ADCD                                           00060009
//********************************************************************  00070008
//*        Precompile the IBM COBOL program                          *  00080008
//********************************************************************  00090008
//PC       EXEC PGM=DSNHPC,PARM='HOST(IBMCOB)'                          00100008
//DBRMLIB  DD  DISP=SHR,                                                00110008
//             DSN=&USER..DBRMLIB(&MEM)                                 00120008
//STEPLIB  DD  DISP=SHR,DSN=DSND10.DBDG.SDSNEXIT                        00130008
//         DD  DISP=SHR,DSN=DSND10.SDSNLOAD                             00140008
//SYSIN    DD  DISP=SHR,DSN=&USER..COBDB2.SRCLIB(&MEM)                  00150009
//SYSCIN   DD  DSN=&&DSNHOUT,DISP=(MOD,PASS),UNIT=SYSDA,                00160008
//             SPACE=(800,(500,500))                                    00170008
//SYSLIB   DD  DISP=SHR,DSN=&USER..COBDB2.SRCLIB(&MEM)                  00180009
//         DD  DISP=SHR,DSN=&USER..DCLLIB                               00190009
//SYSPRINT DD  SYSOUT=*                                                 00200008
//SYSTERM  DD  SYSOUT=*                                                 00210008
//SYSUDUMP DD  SYSOUT=*                                                 00220008
//SYSUT1   DD  SPACE=(800,(500,500),,,ROUND),UNIT=SYSDA                 00230008
//SYSUT2   DD  SPACE=(800,(500,500),,,ROUND),UNIT=SYSDA                 00240008
//********************************************************************  00250008
//*        Compile the IBM COBOL program if the precompile           *  00260008
//*        return code is 4 or less.                                 *  00270008
//********************************************************************  00280008
//COB      EXEC PGM=IGYCRCTL,                                           00290008
//             PARM=(NOSEQUENCE,QUOTE,RENT,'PGMNAME(LONGUPPER)'),       00300008
//             COND=(4,LT,PC)                                           00310008
//SYSPRINT DD  SYSOUT=*                                                 00320008
//SYSTERM  DD  SYSOUT=*                                                 00330008
//SYSLIB   DD  DISP=SHR,DSN=&USER..DCLLIB                               00340009
//SYSLIN   DD  DSN=&&LOADSET,DISP=(MOD,PASS),UNIT=SYSDA,                00350008
//             SPACE=(800,(500,500))                                    00360008
//SYSIN    DD  DSN=&&DSNHOUT,DISP=(OLD,DELETE)                          00370008
//SYSMDECK DD  SPACE=(CYL,(1,2)),UNIT=SYSDA                             00380008
//SYSUT1   DD  SPACE=(800,(500,500),,,ROUND),UNIT=SYSDA                 00390008
//SYSUT2   DD  SPACE=(800,(500,500),,,ROUND),UNIT=SYSDA                 00400008
//SYSUT3   DD  SPACE=(800,(500,500),,,ROUND),UNIT=SYSDA                 00410008
//SYSUT4   DD  SPACE=(800,(500,500),,,ROUND),UNIT=SYSDA                 00420008
//SYSUT5   DD  SPACE=(800,(500,500),,,ROUND),UNIT=SYSDA                 00430008
//SYSUT6   DD  SPACE=(800,(500,500),,,ROUND),UNIT=SYSDA                 00440008
//SYSUT7   DD  SPACE=(800,(500,500),,,ROUND),UNIT=SYSDA                 00450008
//SYSUT8   DD  SPACE=(800,(500,500),,,ROUND),UNIT=SYSDA                 00460008
//SYSUT9   DD  SPACE=(800,(500,500),,,ROUND),UNIT=SYSDA                 00470008
//SYSUT10  DD  SPACE=(800,(500,500),,,ROUND),UNIT=SYSDA                 00480008
//SYSUT11  DD  SPACE=(800,(500,500),,,ROUND),UNIT=SYSDA                 00490008
//SYSUT12  DD  SPACE=(800,(500,500),,,ROUND),UNIT=SYSDA                 00500008
//SYSUT13  DD  SPACE=(800,(500,500),,,ROUND),UNIT=SYSDA                 00510008
//SYSUT14  DD  SPACE=(800,(500,500),,,ROUND),UNIT=SYSDA                 00520008
//SYSUT15  DD  SPACE=(800,(500,500),,,ROUND),UNIT=SYSDA                 00530008
//*                                                                     00540008
//********************************************************************  00550008
//*        Linkedit if the precompile and compile                    *  00560008
//*        return codes are 4 or less.                               *  00570008
//********************************************************************  00580008
//LKED     EXEC PGM=IEWL,PARM='MAP',                                    00590008
//         COND=((4,LT,PC),(4,LT,COB))                                  00600008
//SYSLIB   DD  DISP=SHR,DSN=CEE.SCEELKED                                00610008
//         DD  DISP=SHR,DSN=DSND10.SDSNLOAD                             00620008
//*        DD  DISP=SHR,DSN=IMSVS.RESLIB                                00630008
//         DD  DISP=SHR,DSN=DFH610.CICS.SDFHLOAD                        00640008
//         DD  DISP=SHR,DSN=ISP.SISPLOAD                                00650008
//         DD  DISP=SHR,DSN=GDDM.SADMMOD                                00660008
//SYSLIN   DD  DSN=&&LOADSET,DISP=(OLD,DELETE)                          00670008
//         DD  DDNAME=SYSIN                                             00680008
//SYSLMOD  DD  DSN=&USER..LOADLIB(&MEM),                                00690008
//             DISP=SHR                                                 00700008
//SYSPRINT DD  SYSOUT=*                                                 00710008
//SYSUDUMP DD  SYSOUT=*                                                 00720008
//SYSUT1   DD  SPACE=(1024,(50,50)),UNIT=SYSDA                          00730008
//**********************************************************************00740008