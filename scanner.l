%{
#include <stdio.h>
%}

    /* Extencinones Regilares */
DIGITO  [0-9]
LETRA_MIN [a-z]
LETRA_MAY [A-Z]
ID  {LETRA_MAY}({LETRA_MAY}|{LETRA_MIN}|{DIGITO}|_)*

%%

    /* TOKENS */
"set"       { printf("TOKEN_SET\n"); }
"list"      { printf("TOKEN_LIST\n"); }
"boolean"   { printf("TOKEN_BOOLEAN\n"); }
"while"     { printf("TOKEN_WHILE\n"); }
"for"       { printf("TOKEN_FOR\n"); }
"if"        { printf("TOKEN_IF\n"); }
"else"      { printf("TOKEN_ELSE\n"); }
"do"        { printf("TOKEN_DO\n"); }
"end"       { printf("TOKEN_END\n"); }
"break"     { printf("TOKEN_BREAK\n"); }
"return"    { printf("TOKEN_RETURN\n"); }
"let"       { printf("TOKEN_LET\n"); }
"in"        { printf("TOKEN_IN\n"); }
"where"     { printf("TOKEN_WHERE\n"); }
"empty"     { printf("TOKEN_EMPTY\n"); }
"union"     { printf("TOKEN_UNION\n"); }
"any"       { printf("TOKEN_ANY\n"); }
"append"    { printf("TOKEN_APPEND\n"); }
"insert"    { printf("TOKEN_INSERT\n"); }
"true"      { printf("TOKEN_TRUE\n"); }
"false"     { printf("TOKEN_FALSE\n"); }

    /*OPERADORES*/
"=="        { printf("TOKEN_EQ\n"); }
"!="        { printf("TOKEN_NEQ\n"); }
"="         { printf("TOKEN_ASSIGN\n"); }

    /*SIMBOLOS DE PUNTUACINO*/
":"         { printf("TOKEN_COLON\n"); }
";"         { printf("TOKEN_SEMICOLON\n"); }
","         { printf("TOKEN_COMMA\n"); }
"("         { printf("TOKEN_LPAREN\n"); }
")"         { printf("TOKEN_RPAREN\n"); }
"{"         { printf("TOKEN_LBRACE\n"); }
"}"         { printf("TOKEN_RBRACE\n"); }
"["         { printf("TOKEN_LBRACKET\n"); }
"]"         { printf("TOKEN_RBRACKET\n"); }

\'[^\']\'   { printf("TOKEN_CHAR_LITERAL: %s\n", yytext); }
{ID}        { printf("TOKEN_IDENTIFIER: %s\n", yytext); }
[ \t\n\r]+  { /* ignorar espacios en blanco */ }
.           { printf("Error lexico: Caracter no reconocido %s\n", yytext); }

%%

int main(int argc, char **argv) {
    printf("Iniciando escaner de Aleph. Escriba codigo y presione Ctrl+Z para salir.\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}