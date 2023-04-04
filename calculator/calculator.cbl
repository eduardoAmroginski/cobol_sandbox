      ******************************************************************
      * Author: Eduardo Amroginski Santos
      * Date: 04/04/2023
      * Purpose: Creating a calculator in COBOL
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALCULATOR.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 WS-MODO              PIC X(01).

       77 WS-NUM-1             PIC 9(02).
       77 WS-NUM-2             PIC 9(02).

       77 WS-RESULT            PIC 9(03).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            INITIALISE WS-MODO
                       WS-NUM-1
                       WS-NUM-2
                       WS-RESULT

            PERFORM PROC-MENU
                    THRU PROC-MENU-END

            PERFORM PROC-CONTINUE-OR-EXIT
                    THRU PROC-CONTINUE-OR-EXIT-END

            .
       MAIN-PROCEDURE-END.

       PROC-SOMAR.
            COMPUTE WS-RESULT = WS-NUM-1 + WS-NUM-2.

            DISPLAY "A soma de " WS-NUM-1 " e " WS-NUM-2
                    " é: " WS-RESULT
           .
       PROC-SOMAR-END.

       PROC-SUBTRAIR.
            COMPUTE WS-RESULT = WS-NUM-1 - WS-NUM-2.

            DISPLAY "A subtração de " WS-NUM-1 " e " WS-NUM-2
                    " é: " WS-RESULT
           .
       PROC-SUBTRAIR-END.

       PROC-DIVIDIR.
            IF WS-NUM-2 = 0
               DISPLAY "Não é possivel dividir um numero por ZERO"
               PERFORM MAIN-PROCEDURE THRU MAIN-PROCEDURE-END
            END-IF.

            COMPUTE WS-RESULT = WS-NUM-1 / WS-NUM-2.

            DISPLAY "A divisão de " WS-NUM-1 " e " WS-NUM-2
                    " é: " WS-RESULT
           .
       PROC-DIVIDIR-END.

       PROC-MULTIPLICAR.
            COMPUTE WS-RESULT = WS-NUM-1 * WS-NUM-2.

            DISPLAY "A multiplicação de " WS-NUM-1 " e " WS-NUM-2
                    " é: " WS-RESULT
           .
       PROC-MULTIPLICAR-END.

       PROC-MENU.
            DISPLAY "**************************************************"
            DISPLAY "Selecione o modo que deseja:"
            DISPLAY "<1> para somar"
            DISPLAY "<2> para subtrair"
            DISPLAY "<3> para dividir"
            DISPLAY "<4> para multiplicar"
            DISPLAY "<5> para sair"
            DISPLAY "**************************************************"
            ACCEPT WS-MODO

            DISPLAY "Insira o primeiro numero:"
            ACCEPT WS-NUM-1.

            DISPLAY "Insira o segundo numero:"
            ACCEPT WS-NUM-2.

            EVALUATE WS-MODO
               WHEN "1"
                   PERFORM PROC-SOMAR
                           THRU PROC-SOMAR-END
               WHEN "2"
                   PERFORM PROC-SUBTRAIR
                           THRU PROC-SUBTRAIR-END
               WHEN "3"
                   PERFORM PROC-DIVIDIR
                           THRU PROC-DIVIDIR-END
               WHEN "4"
                   PERFORM PROC-MULTIPLICAR
                           THRU PROC-MULTIPLICAR-END
               WHEN "5"
                   PERFORM PROC-ENCERRAR
               WHEN OTHER
                   DISPLAY "Valor inválido!"
                   PERFORM MAIN-PROCEDURE
                           THRU MAIN-PROCEDURE-END
            END-EVALUATE
            .
       PROC-MENU-END.

       PROC-CONTINUE-OR-EXIT.
            DISPLAY "**************************************************"
            DISPLAY "Você deseja continuar?"
            DISPLAY "<S> para continuar"
            DISPLAY "<QUALQUER TECLA> para sair"
            DISPLAY "**************************************************"
            ACCEPT WS-MODO

            EVALUATE WS-MODO
               WHEN "S"
                   PERFORM MAIN-PROCEDURE
                           THRU MAIN-PROCEDURE-END
               WHEN "s"
                   PERFORM MAIN-PROCEDURE
                           THRU MAIN-PROCEDURE-END
               WHEN OTHER
                   DISPLAY "Finalizando programa..."
                   PERFORM PROC-ENCERRAR
            END-EVALUATE
            .
       PROC-CONTINUE-OR-EXIT-END.

       PROC-ENCERRAR.
            STOP RUN.

       END PROGRAM CALCULATOR.
