       IDENTIFICATION DIVISION.
       PROGRAM-ID. SEQREAD.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT EMPFILE ASSIGN TO INPUT01
           ORGANIZATION IS SEQUENTIAL
           ACCESS MODE  IS SEQUENTIAL
           FILE STATUS  IS WS-FS1.

       DATA DIVISION.
       FILE SECTION.
       FD EMPFILE
           RECORD CONTAINS 80  CHARACTERS
           BLOCK  CONTAINS 800 CHARACTERS
           RECORDING MODE  IS  F
           DATA RECORD     IS EMPFILE-RECORD.

       01 EMPFILE-RECORD.
          05 EMP-ID        PIC X(05).
          05 EMP-NAME      PIC X(15).
          05 EMP-DESG      PIC X(10).
          05 EMP-SALARY    PIC 9(10).
          05 FILLER        PIC X(40).

       WORKING-STORAGE SECTION.
       01 WS-VAR.
          05 WS-FS1        PIC 9(02).
          05 WS-EOF-SW     PIC X(01).
             88 WS-EOF               VALUE 'Y'.
             88 WS-NOT-EOF           VALUE 'N'.

       PROCEDURE DIVISION.

           OPEN INPUT EMPFILE.

           SET  WS-NOT-EOF      TO  TRUE.
           PERFORM UNTIL WS-EOF
                READ EMPFILE
                         AT END SET WS-EOF TO TRUE
                     NOT AT END DISPLAY EMPFILE-RECORD
                END-READ
           END-PERFORM.

           CLOSE EMPFILE.
           STOP RUN.