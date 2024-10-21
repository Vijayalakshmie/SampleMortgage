       IDENTIFICATION DIVISION.
       PROGRAM-ID. TSS2RACF.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INPUT-FILE ASSIGN TO 'INPUT.TXT'
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT OUTPUT-FILE ASSIGN TO 'OUTPUT.TXT'
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD INPUT-FILE.
       01 INPUT-RECORD PIC X(300).

       FD OUTPUT-FILE.
       01 OUTPUT-RECORD PIC X(300).

       WORKING-STORAGE SECTION.
       01 WS-TSS-COMMAND          PIC X(300).

       01 WS-PARSING-FIELDS.
           05 WS-CMD-TYPE          PIC X(10).
           05 WS-RACF-USERID       PIC X(10).
           05 WS-NAME              PIC X(30).
           05 WS-DEPT              PIC X(30).
           05 WS-PASSWORD          PIC X(30).
           05 WS-FACILITY          PIC X(10).
           05 WS-ACCTNUM           PIC X(10).
           05 WS-PROC              PIC X(10).
           05 WS-SIZE              PIC X(10).
           05 WS-MAXSIZE           PIC X(10).
           05 WS-UNIT              PIC X(10).
           05 WS-OWNER             PIC X(10).

       01 WS-RACF-COMMAND.
          05 WS-RACF-ADDUSER      PIC X(7)  VALUE 'ADDUSER'.
          05 WS-RACF-USERID       PIC X(10).
          05 WS-RACF-NAME         PIC X(30).
          05 WS-RACF-DFLTGRP      PIC X(10).
          05 WS-RACF-PASSWORD     PIC X(30).
          05 WS-RACF-PW-INTERVAL  PIC X(20).
          05 WS-RACF-EXPIRED      PIC X(10) VALUE 'EXPIRED'.
          05 WS-RACF-OWNER        PIC X(10).
          05 WS-RACF-TSO          PIC X(60).

       01 EOF-INPUT-FILE          PIC X(1) VALUE 'N'.

       PROCEDURE DIVISION.
           OPEN INPUT INPUT-FILE.
           OPEN OUTPUT OUTPUT-FILE.

           PERFORM UNTIL EOF-INPUT-FILE = 'Y'
               READ INPUT-FILE INTO WS-TSS-COMMAND
                   AT END
                       MOVE 'Y' TO EOF-INPUT-FILE
                   NOT AT END
                       PERFORM PROCESS-TSS-COMMAND
                       PERFORM WRITE-RACF-COMMAND
               END-READ
           END-PERFORM.

           CLOSE INPUT-FILE.
           CLOSE OUTPUT-FILE.
           STOP RUN.

       PROCESS-TSS-COMMAND.
           UNSTRING WS-TSS-COMMAND DELIMITED BY ' ' INTO
               WS-CMD-TYPE
               WS-RACF-USERID
               WS-NAME
               WS-DEPT
               WS-PASSWORD
               WS-FACILITY
               WS-ACCTNUM
               WS-PROC
               WS-SIZE
               WS-MAXSIZE
               WS-UNIT
               WS-OWNER.

           STRING WS-RACF-ADDUSER DELIMITED BY SPACE
                  WS-RACF-USERID DELIMITED BY SPACE
                  'NAME(' WS-NAME ')' DELIMITED BY SPACE
                  'DFLTGRP(' WS-DEPT ')' DELIMITED BY SPACE
                  'PASSWORD(' WS-PASSWORD ')' DELIMITED BY SPACE
                  'PASSWORD-INTERVAL(7)' DELIMITED BY SPACE
                  WS-RACF-EXPIRED DELIMITED BY SPACE
                  'OWNER(' WS-OWNER ')' DELIMITED BY SPACE
                  'TSO(ACCTNUM(' WS-ACCTNUM ')' DELIMITED BY SPACE
                  'PROC(' WS-PROC ')' DELIMITED BY SPACE
                  'SIZE(' WS-SIZE ')' DELIMITED BY SPACE
                  'MAXSIZE(' WS-MAXSIZE ')' DELIMITED BY SPACE
                  'UNIT(' WS-UNIT '))' DELIMITED BY SIZE
                  INTO OUTPUT-RECORD.


       WRITE-RACF-COMMAND.
           WRITE OUTPUT-RECORD.
       IDENTIFICATION DIVISION.
       PROGRAM-ID. TSS2RACF.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INPUT-FILE ASSIGN TO 'INPUT.TXT'
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT OUTPUT-FILE ASSIGN TO 'OUTPUT.TXT'
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD INPUT-FILE.
       01 INPUT-RECORD PIC X(100).

       FD OUTPUT-FILE.
       01 OUTPUT-RECORD PIC X(100).

       WORKING-STORAGE SECTION.
       01 WS-TSS-COMMAND.
          05 WS-CMD-TYPE          PIC X(10).
          05 FILLER               PIC X(90).

       01 WS-NAME                PIC X(30).
       01 WS-DEPT                PIC X(30).
       01 WS-PASSWORD            PIC X(30).
       01 WS-FACILITY            PIC X(10).
       01 WS-ACCTNUM             PIC X(10).
       01 WS-PROC                PIC X(10).
       01 WS-SIZE                PIC X(10).
       01 WS-MAXSIZE             PIC X(10).
       01 WS-UNIT                PIC X(10).
       01 WS-OWNER               PIC X(10).

       01 WS-RACF-COMMAND.
          05 WS-RACF-ADDUSER      PIC X(7)  VALUE 'ADDUSER'.
          05 WS-RACF-USERID       PIC X(10).
          05 WS-RACF-NAME         PIC X(30).
          05 WS-RACF-DFLTGRP      PIC X(10).
          05 WS-RACF-PASSWORD     PIC X(30).
          05 WS-RACF-PW-INTERVAL  PIC X(20).
          05 WS-RACF-EXPIRED      PIC X(10) VALUE 'EXPIRED'.
          05 WS-RACF-OWNER        PIC X(10).
          05 WS-RACF-TSO          PIC X(60).

       PROCEDURE DIVISION.
           OPEN INPUT INPUT-FILE.
           OPEN OUTPUT OUTPUT-FILE.

           PERFORM UNTIL EOF-INPUT-FILE
               READ INPUT-FILE INTO WS-TSS-COMMAND
                   AT END
                       SET EOF-INPUT-FILE TO TRUE
                   NOT AT END
                       PERFORM PROCESS-TSS-COMMAND
                       PERFORM WRITE-RACF-COMMAND
               END-READ
           END-PERFORM.

           CLOSE INPUT-FILE.
           CLOSE OUTPUT-FILE.
           STOP RUN.

       PROCESS-TSS-COMMAND.
           UNSTRING WS-TSS-COMMAND DELIMITED BY ' ' INTO
               WS-CMD-TYPE
               WS-RACF-USERID
               WS-NAME
               WS-DEPT
               WS-PASSWORD
               WS-FACILITY
               WS-ACCTNUM
               WS-PROC
               WS-SIZE
               WS-MAXSIZE
               WS-UNIT
               WS-OWNER.

           STRING WS-RACF-ADDUSER DELIMITED BY SPACE
                  WS-RACF-USERID DELIMITED BY SPACE
                  'NAME(' WS-NAME ')' DELIMITED BY SPACE
                  'DFLTGRP(' WS-DEPT ')' DELIMITED BY SPACE
                  'PASSWORD(' WS-PASSWORD ')' DELIMITED BY SPACE
                  'PASSWORD-INTERVAL(7)' DELIMITED BY SPACE
                  WS-RACF-EXPIRED DELIMITED BY SPACE
                  'OWNER(' WS-OWNER ')' DELIMITED BY SPACE
                  'TSO(ACCTNUM(' WS-ACCTNUM ')' -
                  ' PROC(' WS-PROC ')'          -
                  ' SIZE(' WS-SIZE ')'          -
                  ' MAXSIZE(' WS-MAXSIZE ')'    -
                  ' UNIT(' WS-UNIT '))'
                  DELIMITED BY SIZE INTO OUTPUT-RECORD.

       WRITE-RACF-COMMAND.
           WRITE OUTPUT-RECORD.
