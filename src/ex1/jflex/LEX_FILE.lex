/***************************/
/* FILE NAME: LEX_FILE.lex */
/***************************/

/*************/
/* USER CODE */
/*************/
import java_cup.runtime.*;

/******************************/
/* DOLAR DOLAR - DON'T TOUCH! */
/******************************/

%%

/************************************/
/* OPTIONS AND DECLARATIONS SECTION */
/************************************/
   
/*****************************************************/ 
/* Lexer is the name of the class JFlex will create. */
/* The code will be written to the file Lexer.java.  */
/*****************************************************/ 
%class Lexer

/********************************************************************/
/* The current line number can be accessed with the variable yyline */
/* and the current column number with the variable yycolumn.        */
/********************************************************************/
%line
%column

/*******************************************************************************/
/* Note that this has to be the EXACT same name of the class the CUP generates */
/*******************************************************************************/
%cupsym TokenNames

/******************************************************************/
/* CUP compatibility mode interfaces with a CUP generated parser. */
/******************************************************************/
%cup

/****************/
/* DECLARATIONS */
/****************/
/*****************************************************************************/   
/* Code between %{ and %}, both of which must be at the beginning of a line, */
/* will be copied verbatim (letter to letter) into the Lexer class code.     */
/* Here you declare member variables and functions that are used inside the  */
/* scanner actions.                                                          */  
/*****************************************************************************/   
%{
	/*********************************************************************************/
	/* Create a new java_cup.runtime.Symbol with information about the current token */
	/*********************************************************************************/
	private Symbol symbol(int type)               {return new Symbol(type, yyline, yycolumn);}
	private Symbol symbol(int type, Object value) {return new Symbol(type, yyline, yycolumn, value);}

	/*******************************************/
	/* Enable line number extraction from main */
	/*******************************************/
	public int getLine() { return yyline + 1; } 

	/**********************************************/
	/* Enable token position extraction from main */
	/**********************************************/
	public int getTokenStartPosition() { return yycolumn + 1; } 
%}

/***********************/
/* MACRO DECALARATIONS */
/***********************/
LineTerminator	= \r|\n|\r\n
WhiteSpace		= {LineTerminator} | [ \t]
INTEGER			= 0 | [1-9][0-9]*
ID               = [a-zA-Z0-9]+
COMMENT			= \/\/[^\n]*
COMMENT_TYPE_2   = \/\*([^*]|\*+[^*/])*\*+\/
TYPE_STRING = "([^\"\\]|\\\\.)*"

/******************************/
/* DOLAR DOLAR - DON'T TOUCH! */
/******************************/

%%

/************************************************************/
/* LEXER matches regular expressions to actions (Java code) */
/************************************************************/

/**************************************************************/
/* YYINITIAL is the state at which the lexer begins scanning. */
/* So these regular expressions will only be matched if the   */
/* scanner is in the start state YYINITIAL.                   */
/**************************************************************/

<YYINITIAL> {
    "+"           { return symbol(TokenNames.PLUS, "PLUS"); }
    "-"           { return symbol(TokenNames.MINUS, "MINUNS"); }
    "*"           { return symbol(TokenNames.TIMES, "TIMES"); }
    "/"           { return symbol(TokenNames.DIVIDE, "DIVIDE"); }
    "("           { return symbol(TokenNames.LPAREN , "LPAREN"); }
    ")"           { return symbol(TokenNames.RPAREN , "RPAREN"); }
    "{"           { return symbol(TokenNames.LBRACE , "LBRACE"); }
    "}"           { return symbol(TokenNames.RBRACE , "RBRACE"); }
	"["           { return symbol(TokenNames.LBRACK , "LBRACK"); }
    "]"           { return symbol(TokenNames.RBRACK , "RBRACK"); }
	"[]"           { return symbol(TokenNames.ARRAY , "ARRAY"); }

    "int"         { return symbol(TokenNames.TYPE_INT, "TYPE_INT"); }
	"extends"         { return symbol(TokenNames.EXTENDS, "EXTENDS"); }
	"new"         { return symbol(TokenNames.NEW, "NEW"); }
    "void"        { return symbol(TokenNames.TYPE_VOID, "TYPE_VOID"); }
    "while"       { return symbol(TokenNames.WHILE, "WHILE"); }
    "if"          { return symbol(TokenNames.IF, "IF"); }
    "return"      { return symbol(TokenNames.RETURN, "RETURN"); }
    "else"        { return symbol(TokenNames.ELSE, "ELSE"); }
    ":="          { return symbol(TokenNames.ASSIGN, "ASSIGN"); }
    ";"           { return symbol(TokenNames.SEMICOLON, "SEMICOLON"); }
    ","           { return symbol(TokenNames.COMMA, "COMMA"); }
	"="           { return symbol(TokenNames.EQ, "EQ"); }
	"class"           { return symbol(TokenNames.CLASS, "CLASS"); }
	"nil"         { return symbol(TokenNames.NIL, "NIL"); }
	"."         { return symbol(TokenNames.DOT, "DOT"); }


	{TYPE_STRING} {return symbol(TokenNames.TYPE_STRING, "STRING(" + yytext() + ")"); }
	{COMMENT}	  {}
	{COMMENT_TYPE_2} {}

	"<"          { return symbol(TokenNames.LT, "LT"); }
	">"          { return symbol(TokenNames.LT, "GT"); }

    // Add more rules for other tokens as needed

    {INTEGER}     { 
		if (Integer.parseInt(yytext()) < 32768)
		{
			return symbol(TokenNames.NUMBER, "INT(" + Integer.parseInt(yytext()) + ")"); 
		}
			return symbol(TokenNames.EOF, "ERROR"); 
		}
    {ID}          { return symbol(TokenNames.ID, "ID(" +yytext() + ")"); }
    {WhiteSpace}  { /* just skip what was found, do nothing */ }
    <<EOF>>       { return symbol(TokenNames.EOF); }
}