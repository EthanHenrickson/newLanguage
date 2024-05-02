%{
#include <stdlib.h>
#include "y.tab.h"
%}

%%
"function"              { return FUNCTION; }
"let"                   { return LET; }
"var"                   { return VAR; }
"const"                 { return CONST; }
"void"                  { return VOID; }
"if"                    { return IF; }
"else"                  { return ELSE; }
"while"                 { return WHILE; }
"true"                  { return TRUE; }
"false"                 { return FALSE; }
"console.log"           { return CONSOLE_LOG; }
";"                     { return SEMICOLON; }
"("                     { return LEFT_PAREN; }
")"                     { return RIGHT_PAREN; }
"{"                     { return LEFT_BRACE; }
"}"                     { return RIGHT_BRACE; }
"="                     { return ASSIGN; }
"=="                    { return EQ; }
"!="                    { return NEQ; }
"<"                     { return LT; }
"<="                    { return LE; }
">"                     { return GT; }
">="                    { return GE; }
"+"                     { return PLUS; }
"-"                     { return MINUS; }
"*"                     { return MULTIPLY; }
"/"                     { return DIVIDE; }
"%"                     { return MODULO; }
"&&"                    { return AND; }
"||"                    { return OR; }
"!"                     { return NOT; }
"//".*                  /* ignore single-line comments */
[a-zA-Z]+[0-9]*         { yylval.str = strdup(yytext); return IDENTIFIER; }
[0-9]+                  { yylval.str = strdup(yytext); return INTEGER; }
\"(\\.|[^\\"])*\"       { yylval.str = strdup(yytext); return STRING; }
[0-9]+\.[0-9]*          { yylval.str = strdup(yytext); return FLOAT; }
[ \t\n]                 /* ignore whitespace */
.                       { yyerror("invalid character"); }
%%

int yywrap(void) {
    return 1;
}