IDENTIFICATION DIVISION.
       PROGRAM-ID. CobolCalculator.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 INPUT-OUTPUT-AREA.
          05 INPUT-STRING PIC X(58).  *> Assuming the first 58 chars are for input
          05 CHECK-DIGIT  PIC 9(2).  *> 2 digits for the check digit sum
       01 SUM-ACCUM      PIC 9(4) VALUE ZERO.
       01 I              PIC 9(2) VALUE 1.
       01 CHAR-VAL       PIC 9(2).
       
       PROCEDURE DIVISION.
       BEGIN.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > LENGTH OF INPUT-STRING
               COMPUTE CHAR-VAL = FUNCTION NUMVAL(FUNCTION SUBSTRING(INPUT-STRING, I, 1))
               ON EXCEPTION
                   CONTINUE
               NOT ON EXCEPTION
                   ADD CHAR-VAL TO SUM-ACCUM
               END-COMPUTE
           END-PERFORM.
           
           MOVE SUM-ACCUM TO CHECK-DIGIT.
           DISPLAY "Computed check digit: " CHECK-DIGIT.
           
           *> Assuming the modified string gets returned somehow. The actual mechanism
           *> for returning data will depend on how your Java-COBOL interface is designed.
           *> This might involve writing back to a shared memory location, using a file,
           *> or another method as per your project's architecture.
           
           STOP RUN.



      Start in Java!!!!
Input :::
Java: String in pointer:                                                            
Java: before calling cobol..######
com.microfocus.cobol.CobolProgramNotFoundException: CobolCalculator not found
Java: after calling cobol..#######
	at com.microfocus.cobol.RuntimeSystem.cobcall_int(Native Method)
	at com.microfocus.cobol.RuntimeSystem.cobcall(Unknown Source)
	at com.microfocus.javademo.JavaCalculatorClient.main(JavaCalculatorClient.java:26)
Java: Print string pointer with Checkdigit:                                            
Java: Print string pointer: -1
