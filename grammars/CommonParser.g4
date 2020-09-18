/*
Defines lexer rules that are commonly used in a variety of contexts.
*/
parser grammar CommonParser;
options {
    tokenVocab=CommonLexer;
}

// Declare properties
propertyDeclaration:
    booleanPropertyDeclaration |
    intPropertyDeclaration |
    stringPropertyDeclaration |
    floatPropertyDeclaration |
    listPropertyDeclaration |
    blockPropertyDeclaration |
    identifierPropertyDeclaration;

booleanPropertyDeclaration: identifier EQ booleanPropertyValue;
intPropertyDeclaration: identifier EQ intPropertyValue;
identifierPropertyDeclaration: identifier EQ identifierPropertyValue;
stringPropertyDeclaration: identifier EQ stringPropertyValue;
floatPropertyDeclaration: identifier EQ floatPropertyValue;
listPropertyDeclaration:
    singletonListDeclaration |
    listBlockDeclaration;
blockPropertyDeclaration: identifier START_BLOCK propertyDeclaration* CLOSE_BRACE;

singletonListDeclaration: identifier singletonListBody;
listBlockDeclaration: identifier listBodyDeclaration;

singletonListBody: EQ listValue;
listBodyDeclaration:START_BLOCK ENDLINE? listValue* CLOSE_BRACE;

listValue:
    (identifier |
    string) ENDLINE;

identifier: WORD (WORD | DOT | DIGIT)*;

string: QUOTE INSIDE_STRING*? CLOSE_QUOTE;

booleanPropertyValue: (YES | NO);
intPropertyValue: INT;
identifierPropertyValue: CHARACTER+;
stringPropertyValue: string;
floatPropertyValue: (FLOAT | INT);