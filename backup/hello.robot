*** Settings ***
Library    hello.py

*** Test Cases ***
Deve retornar a mensagem de boas vindas
    ${resultado}=    Hello Robot    Anderson
    Should Be Equal    ${resultado}    Olá, Anderson.