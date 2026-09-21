IDENTIFICATION DIVISION.
       PROGRAM-ID. STATS.
       AUTHOR. YOUR-NAME.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-NUMS.
           05  WS-NUM              OCCURS 10 TIMES PIC S9(4).
       01  WS-SUM                  PIC S9(6) VALUE 0.
       01  WS-AVG                  PIC S9(4)V99.
       01  WS-MIN                  PIC S9(4).
       01  WS-MAX                  PIC S9(4).
       01  WS-I                    PIC 9(2).
       01  WS-SUM-OUT              PIC -ZZZZ9.
       01  WS-AVG-OUT              PIC -ZZZ9.99.
       01  WS-MIN-OUT              PIC -ZZZZ9.
       01  WS-MAX-OUT              PIC -ZZZZ9.

       PROCEDURE DIVISION.
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 10
               ACCEPT WS-NUM(WS-I)
               ADD WS-NUM(WS-I) TO WS-SUM
           END-PERFORM

           MOVE WS-NUM(1) TO WS-MIN
           MOVE WS-NUM(1) TO WS-MAX

           PERFORM VARYING WS-I FROM 2 BY 1 UNTIL WS-I > 10
               IF WS-NUM(WS-I) < WS-MIN
                   MOVE WS-NUM(WS-I) TO WS-MIN
               END-IF
               IF WS-NUM(WS-I) > WS-MAX
                   MOVE WS-NUM(WS-I) TO WS-MAX
               END-IF
           END-PERFORM

           COMPUTE WS-AVG ROUNDED = WS-SUM / 10

           MOVE WS-SUM TO WS-SUM-OUT
           MOVE WS-AVG TO WS-AVG-OUT
           MOVE WS-MIN TO WS-MIN-OUT
           MOVE WS-MAX TO WS-MAX-OUT

           DISPLAY "Sum: " FUNCTION TRIM(WS-SUM-OUT)
           DISPLAY "Avg: " FUNCTION TRIM(WS-AVG-OUT)
           DISPLAY "Min: " FUNCTION TRIM(WS-MIN-OUT)
           DISPLAY "Max: " FUNCTION TRIM(WS-MAX-OUT)
           STOP RUN.