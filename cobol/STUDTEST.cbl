       IDENTIFICATION DIVISION.                                         00010000
       PROGRAM-ID. STUDTEST.                                            00020000
       ENVIRONMENT DIVISION.                                            00040000
       DATA DIVISION.                                                   00050000
       WORKING-STORAGE SECTION.                                         00060000
      *                                                                 00070000
       01 WS-STUDENT.                                                   00080000
          05 WS-STUDID                 PIC S9(9) USAGE COMP-5.          00090000
          05 WS-STUDNAME               PIC X(30).                       00100000
          05 WS-DEGREE                 PIC X(5).                        00110000
          05 WS-STUDGRP                PIC X(10).                       00120000
          05 WS-CURR-SEM               PIC S9(9) USAGE COMP-5.          00130000
          05 WS-YEAR-PASS              PIC S9(9) USAGE COMP-5.          00140000
      *                                                                 00150000
           EXEC SQL                                                     00160000
               INCLUDE SQLCA                                            00170000
           END-EXEC.                                                    00180000
      *                                                                 00190000
           EXEC SQL                                                     00200000
               INCLUDE STUDTAB                                          00210000
           END-EXEC.                                                    00220000
      *                                                                 00230000
           EXEC SQL                                                     00240000
             DECLARE STUDENT_CURSOR CURSOR FOR                          00250000
               SELECT STUDID, STUDNAME, DEGREE, STUDGRP,                00260000
                      CURRSEM, YEARPASS                                 00270000
               FROM STUDTAB                                             00280000
               WHERE STUDID = :WS-STUDID                                00290000
           END-EXEC.                                                    00300000
      *                                                                 00310000
      *                                                                 00320000
       PROCEDURE DIVISION.                                              00330000
           DISPLAY 'STUDENT TABLE - SAMPLE DB2 PROGRAM'.                00340000
      *                                                                 00350000
           MOVE 101001 TO WS-STUDID.                                    00360000
      *SELECT QUERY - CHECK IF THE STUDID IS PRESENT IN TABLE STUDENT.  00370000
      *                                                                 00380000
              EXEC SQL                                                  00390000
                  OPEN STUDENT_CURSOR                                   00400000
              END-EXEC.                                                 00410000
      *                                                                 00420000
              EXEC SQL                                                  00430000
                 FETCH STUDENT_CURSOR INTO :WS-STUDID, :WS-STUDNAME,    00440000
                 :WS-DEGREE,:WS-STUDGRP, :WS-CURR-SEM, :WS-YEAR-PASS    00450000
              END-EXEC.                                                 00460000
      *                                                                 00470000
           IF SQLCODE = 0                                               00480000
                       DISPLAY 'STUDENT RECORD FOUND:'                  00490000
                       DISPLAY 'ID      : ' WS-STUDID                   00500000
                       DISPLAY 'NAME    : ' WS-STUDNAME                 00510000
                       DISPLAY 'DEGREE  : ' WS-DEGREE                   00520000
           ELSE                                                         00530000
               DISPLAY 'SQL ERROR:' SQLCODE','SQLSTATE                  00540000
           END-IF.                                                      00550000
      *                                                                 00560000
      *                                                                 00570000
              EXEC SQL                                                  00580000
                 CLOSE STUDENT_CURSOR                                   00590000
              END-EXEC.                                                 00600000
      *                                                                 00610000
           STOP RUN.                                                    00620000