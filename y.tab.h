
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     IDENTIFIER = 258,
     INTEGER = 259,
     STRING = 260,
     FLOAT = 261,
     FUNCTION = 262,
     LET = 263,
     VAR = 264,
     CONST = 265,
     VOID = 266,
     IF = 267,
     ELSE = 268,
     WHILE = 269,
     TRUE = 270,
     FALSE = 271,
     CONSOLE_LOG = 272,
     SEMICOLON = 273,
     LEFT_PAREN = 274,
     RIGHT_PAREN = 275,
     LEFT_BRACE = 276,
     RIGHT_BRACE = 277,
     ASSIGN = 278,
     EQ = 279,
     NEQ = 280,
     LT = 281,
     LE = 282,
     GT = 283,
     GE = 284,
     PLUS = 285,
     MINUS = 286,
     MULTIPLY = 287,
     DIVIDE = 288,
     MODULO = 289,
     AND = 290,
     OR = 291,
     NOT = 292
   };
#endif
/* Tokens.  */
#define IDENTIFIER 258
#define INTEGER 259
#define STRING 260
#define FLOAT 261
#define FUNCTION 262
#define LET 263
#define VAR 264
#define CONST 265
#define VOID 266
#define IF 267
#define ELSE 268
#define WHILE 269
#define TRUE 270
#define FALSE 271
#define CONSOLE_LOG 272
#define SEMICOLON 273
#define LEFT_PAREN 274
#define RIGHT_PAREN 275
#define LEFT_BRACE 276
#define RIGHT_BRACE 277
#define ASSIGN 278
#define EQ 279
#define NEQ 280
#define LT 281
#define LE 282
#define GT 283
#define GE 284
#define PLUS 285
#define MINUS 286
#define MULTIPLY 287
#define DIVIDE 288
#define MODULO 289
#define AND 290
#define OR 291
#define NOT 292




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 14 "js2py.y"

    char *str;



/* Line 1676 of yacc.c  */
#line 132 "y.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


