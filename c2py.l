%{
#include <stdio.h>
#include "y.tab.h"
%}

%%
"#".*                   ;
"int"                   { return INT; }
"float"                 { return FLOAT; }
"if"                    { return IF; }
"else"                  { return ELSE; }
"while"                 { return WHILE; }
"for"                   { return FOR; }
"return"                { return RETURN; }
"=="                    { return EQ; }
"!="                    { return NEQ; }
">="                    { return GTE; }
"<="                    { return LTE; }
"="                     { return '='; }
">"                     { return '>'; }
"<"                     { return '<'; }
"+"                     { return '+'; }
"-"                     { return '-'; }
"*"                     { return '*'; }
"/"                     { return '/'; }
"{"                     { return '{'; }
"}"                     { return '}'; }
"("                     { return '('; }
")"                     { return ')'; }
";"                     { return ';'; }
[a-zA-Z_][a-zA-Z0-9_]*  { yylval.string = strdup(yytext); return ID; }
[0-9]+                  { yylval.integer = atoi(yytext); return INT_CONST; }
[0-9]+"."[0-9]+         { yylval.real = atof(yytext); return FLOAT_CONST; }
[ \t\n]                 ; /* skip whitespace */
.                       { printf("Invalid character: %c\n", yytext[0]); }
%%

int yywrap(void) {
    return 1;
}