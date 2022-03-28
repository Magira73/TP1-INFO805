/* --------------------------Section de Code Utilisateur---------------------*/
package fr.usmb.m1isc.compilation.simple;
import java_cup.runtime.Symbol;

%%

/* -----------------Section des Declarations et Options----------------------*/
// nom de la class a generer
%class SimpleLexer
%unicode
%line   // numerotation des lignes
%column // numerotation caracteres par ligne

// utilisation avec CUP
// nom de la classe generee par CUP qui contient les symboles terminaux
%cupsym SimpleParserSym
// generation analyser lexical pour CUP
%cup

// code a ajouter dans la classe produite
%{

%}

%{eofval
 return new Symbol(SimpleParserSym.EOF) ;
%eofval}

// definitions

Sign           = "-"
nombreNegatif     = {Sign}? ([1-9][0-9]*)
nombre = [0-9]*
blanc = \t | \n | \r | \s
com = \/\* .* \*\/ | \/\/
variable = [a-zA-Z]+

%%

{nombreNegatif} {return new Symbol(SimpleParserSym.ENTIER,new Integer(yytext()));}
{nombre} {return new Symbol(SimpleParserSym.ENTIER,new Integer(yytext()));}
"+" {return new Symbol(SimpleParserSym.PLUS);}
"-" {return new Symbol(SimpleParserSym.MOINS);}
"*" {return new Symbol(SimpleParserSym.MULT);}
"/" {return new Symbol(SimpleParserSym.DIV);}
"(" {return new Symbol(SimpleParserSym.PAR_G);}
")" {return new Symbol(SimpleParserSym.PAR_D);}
";" {return new Symbol(SimpleParserSym.FIN);}
"mod" {return new Symbol(SimpleParserSym.MOD);}
"erreur" {return new Symbol(SimpleParserSym.ERR);}
{blanc} { ; /* on fait rien */ }
{com} { ; /* on fait rien */ }

"let" {return new Symbol(SimpleParserSym.LET);}
"=" {return new Symbol(SimpleParserSym.EGAL);}
{variable} {return new Symbol(SimpleParserSym.VAR);}

