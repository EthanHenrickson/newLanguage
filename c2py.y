%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
extern int yyparse();
extern FILE* yyin;

void yyerror(const char* s);
%}

%union {
    int integer;
    float real;
    char *string;
}

%token <integer> INT_CONST
%token <real> FLOAT_CONST
%token <string> ID
%token INT FLOAT IF ELSE WHILE FOR RETURN EQ NEQ GTE LTE

%type <string> expression assignment return_statement
%type <string> if_statement while_statement for_statement

%%

program:
    statements
    ;

statements:
    statement
    | statements statement
    ;

statement:
    declaration
    | assignment
    | if_statement
    | while_statement
    | for_statement
    | return_statement
    ;

declaration:
    INT ID ';' { printf("%s = 0\n", $2); }
    | FLOAT ID ';' { printf("%s = 0.0\n", $2); }
    ;

assignment:
    ID '=' expression ';' { printf("%s = %s\n", $1, $3); }
    ;

if_statement:
    IF '(' expression ')' '{' statements '}' { printf("if %s:\n", $3); }
    | IF '(' expression ')' '{' statements '}' ELSE '{' statements '}' { printf("if %s:\n", $3); printf("else:\n"); }
    ;

while_statement:
    WHILE '(' expression ')' '{' statements '}' { printf("while %s:\n", $3); }
    ;

for_statement:
    FOR '(' assignment ';' expression ';' assignment ')' '{' statements '}' { printf("for %s; %s; %s:\n", $3, $5, $7); }
    ;

return_statement:
    RETURN expression ';' { printf("return %s\n", $2); }
    ;

expression:
    ID { $$ = strdup($1); }
    | INT_CONST { asprintf(&$$, "%d", $1); }
    | FLOAT_CONST { asprintf(&$$, "%f", $1); }
    | expression '+' expression { asprintf(&$$, "%s + %s", $1, $3); free($1); free($3); }
    | expression '-' expression { asprintf(&$$, "%s - %s", $1, $3); free($1); free($3); }
    | expression '*' expression { asprintf(&$$, "%s * %s", $1, $3); free($1); free($3); }
    | expression '/' expression { asprintf(&$$, "%s / %s", $1, $3); free($1); free($3); }
    | expression EQ expression { asprintf(&$$, "%s == %s", $1, $3); free($1); free($3); }
    | expression NEQ expression { asprintf(&$$, "%s != %s", $1, $3); free($1); free($3); }
    | expression GTE expression { asprintf(&$$, "%s >= %s", $1, $3); free($1); free($3); }
    | expression LTE expression { asprintf(&$$, "%s <= %s", $1, $3); free($1); free($3); }
    | expression '>' expression { asprintf(&$$, "%s > %s", $1, $3); free($1); free($3); }
    | expression '<' expression { asprintf(&$$, "%s < %s", $1, $3); free($1); free($3); }
    ;
%%

void yyerror(const char* s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(int argc, char **argv) {
    if (argc > 1) {
        FILE *file = fopen(argv[1], "r");
        if (file == NULL) {
            printf("Error opening file: %s\n", argv[1]);
            return 1;
        }
        yyin = file;
    }

    yyparse();

    return 0;
}