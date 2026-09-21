       IDENTIFICATION DIVISION.
       PROGRAM-ID. NAMEBANNER.
      *> Author: TusharB-07

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WS-NAME       PIC X(20).
       01 WS-GREETING   PIC X(40).
       01 WS-BORDER     PIC X(50).
       01 WS-LEN        PIC 9(2).
       01 WS-I          PIC 9(2).

       PROCEDURE DIVISION.
           DISPLAY "Enter your name: " WITH NO ADVANCING
           ACCEPT WS-NAME

           STRING
               "Hello, "
               FUNCTION TRIM(WS-NAME)
               "!"
               DELIMITED BY SIZE
               INTO WS-GREETING
           END-STRING

           COMPUTE WS-LEN =
               FUNCTION LENGTH(FUNCTION TRIM(WS-NAME)) + 10

           PERFORM VARYING WS-I FROM 1 BY 1
               UNTIL WS-I > WS-LEN
               DISPLAY "*" WITH NO ADVANCING
           END-PERFORM

           DISPLAY SPACE
           DISPLAY "* " FUNCTION TRIM(WS-GREETING) " *"

           PERFORM VARYING WS-I FROM 1 BY 1
               UNTIL WS-I > WS-LEN
               DISPLAY "*" WITH NO ADVANCING
           END-PERFORM

           DISPLAY SPACE

           STOP RUN.
