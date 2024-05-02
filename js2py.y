%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char *str) {
    fprintf(stderr, "error: %s\n", str);
}

extern FILE* yyin;

%}

%union {
    char *str;
}

%token <str> IDENTIFIER INTEGER STRING FLOAT
%token FUNCTION LET VAR CONST VOID IF ELSE WHILE TRUE FALSE CONSOLE_LOG
%token SEMICOLON LEFT_PAREN RIGHT_PAREN LEFT_BRACE RIGHT_BRACE
%token ASSIGN EQ NEQ LT LE GT GE PLUS MINUS MULTIPLY DIVIDE MODULO AND OR NOT

%type <str> program statement function_declaration statement_list variable_declaration
%type <str> if_statement while_statement console_log_statement
%type <str> expression

%%

program:
    /* empty */ 
    | program statement
    ;

statement:
    function_declaration
    | variable_declaration
    | if_statement
    | while_statement
    | console_log_statement
    | expression SEMICOLON { printf("%s\n", $1); }
    ;

function_declaration:
    FUNCTION IDENTIFIER LEFT_PAREN RIGHT_PAREN LEFT_BRACE statement_list RIGHT_BRACE { asprintf(&$$, "def %s():\n%s", $2, $6); printf("%s", $$); }
    ;

statement_list:
    /* empty */ { $$ = strdup(""); }
    | statement_list statement { char *temp; asprintf(&temp, "%s    %s", $1, $2); $$ = temp; }
    ;

variable_declaration:
    LET IDENTIFIER ASSIGN expression SEMICOLON { asprintf(&$$, "%s = %s\n", $2, $4); printf("%s", $$); }
    | VAR IDENTIFIER ASSIGN expression SEMICOLON { asprintf(&$$, "%s = %s\n", $2, $4); printf("%s", $$); }
    | CONST IDENTIFIER ASSIGN expression SEMICOLON { asprintf(&$$, "%s = %s\n", $2, $4); printf("%s", $$); }
    | IDENTIFIER ASSIGN expression SEMICOLON { asprintf(&$$, "%s\n", $3); }
    ;

if_statement:
    IF LEFT_PAREN expression RIGHT_PAREN LEFT_BRACE statement_list RIGHT_BRACE { asprintf(&$$, "\nif %s:\n%s", $3, $6); printf("%s", $$); }
    | IF LEFT_PAREN expression RIGHT_PAREN LEFT_BRACE statement_list RIGHT_BRACE ELSE LEFT_BRACE statement_list RIGHT_BRACE { asprintf(&$$, "if %s:\n%selse:\n%s", $3, $6, $10); printf("%s", $$); }
    ;

while_statement:
    WHILE LEFT_PAREN expression RIGHT_PAREN LEFT_BRACE statement_list RIGHT_BRACE { asprintf(&$$, "while %s:\n%s", $3, $6); printf("%s", $$); }
    ;


console_log_statement:
    CONSOLE_LOG LEFT_PAREN expression RIGHT_PAREN SEMICOLON { asprintf(&$$, "print(%s)\n", $3); }
    ;

expression:
    IDENTIFIER { $$ = $1; }
    | INTEGER { $$ = $1; }
    | STRING { $$ = $1; }
    | FLOAT { $$ = $1; }
    | TRUE { $$ = strdup("True"); }
    | FALSE { $$ = strdup("False"); }
    | VOID { $$ = strdup("None"); }
    | expression PLUS expression { asprintf(&$$, "%s + %s", $1, $3); }
    | expression MINUS expression { asprintf(&$$, "%s - %s", $1, $3); }
    | expression MULTIPLY expression { asprintf(&$$, "%s * %s", $1, $3); }
    | expression DIVIDE expression { asprintf(&$$, "%s / %s", $1, $3); }
    | expression MODULO expression { asprintf(&$$, "%s %% %s", $1, $3); }
    | expression EQ expression { asprintf(&$$, "%s == %s", $1, $3); }
    | expression NEQ expression { asprintf(&$$, "%s != %s", $1, $3); }
    | expression LT expression { asprintf(&$$, "%s < %s", $1, $3); }
    | expression LE expression { asprintf(&$$, "%s <= %s", $1, $3); }
    | expression GT expression { asprintf(&$$, "%s > %s", $1, $3); }
    | expression GE expression { asprintf(&$$, "%s >= %s", $1, $3); }
    | expression AND expression { asprintf(&$$, "%s and %s", $1, $3); }
    | expression OR expression { asprintf(&$$, "%s or %s", $1, $3); }
    | NOT expression { asprintf(&$$, "not %s", $2); }
    | LEFT_PAREN expression RIGHT_PAREN { $$ = $2; }
    ;

%%

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