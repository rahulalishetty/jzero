%%
%int
id=([a-zA-Z_][a-zA-Z0-9_]*)
%%
"/*"([^*]|"*"+[^/*])*"*"+"/" { JzeroScanner.comment(); }
"//".*\r?\n                  { JzeroScanner.comment(); }
[ \t\r\f]+                   { JzeroScanner.whitespace(); }
\n                     { JzeroScanner.newline(); }
"break"                { return JzeroScanner.scan(Parser.BREAK); }
"double"               { return JzeroScanner.scan(Parser.DOUBLE); } 
"else"                 { return JzeroScanner.scan(Parser.ELSE); }
"false"                { return JzeroScanner.scan(Parser.BOOLLIT); }
"for"                  { return JzeroScanner.scan(Parser.FOR); }
"if"                   { return JzeroScanner.scan(Parser.IF); }
"int"                  { return JzeroScanner.scan(Parser.INT); }
"null"                 { return JzeroScanner.scan(Parser.NULLVAL); }
"public"               { return JzeroScanner.scan(Parser.PUBLIC); }
"return"               { return JzeroScanner.scan(Parser.RETURN); }
"static"               { return JzeroScanner.scan(Parser.STATIC); }
"string"               { return JzeroScanner.scan(Parser.STRING); }
"true"                 { return JzeroScanner.scan(Parser.BOOLLIT); }
"bool"                 { return JzeroScanner.scan(Parser.BOOL); }
"void"                 { return JzeroScanner.scan(Parser.VOID); }
"while"                { return JzeroScanner.scan(Parser.WHILE); }
"class"                { return JzeroScanner.scan(Parser.CLASS); }
"("                    { return JzeroScanner.scan(JzeroScanner.ord("("));}
")"                    { return JzeroScanner.scan(JzeroScanner.ord(")"));}
"["                    { return JzeroScanner.scan(JzeroScanner.ord("["));}
"]"                    { return JzeroScanner.scan(JzeroScanner.ord("]"));}
"{"                    { return JzeroScanner.scan(JzeroScanner.ord("{"));}
"}"                    { return JzeroScanner.scan(JzeroScanner.ord("}"));}
";"                    { return JzeroScanner.scan(JzeroScanner.ord(";"));}
":"                    { return JzeroScanner.scan(JzeroScanner.ord(":"));}
"!"                    { return JzeroScanner.scan(JzeroScanner.ord("!"));}
"*"                    { return JzeroScanner.scan(JzeroScanner.ord("*"));}
"/"                    { return JzeroScanner.scan(JzeroScanner.ord("/"));}
"%"                    { return JzeroScanner.scan(JzeroScanner.ord("%"));}
"+"                    { return JzeroScanner.scan(JzeroScanner.ord("+"));}
"-"                    { return JzeroScanner.scan(JzeroScanner.ord("-"));}
"<"                    { return JzeroScanner.scan(JzeroScanner.ord("<"));}
"<="                   { return JzeroScanner.scan(Parser.LESSTHANOREQUAL);}
">"                    { return JzeroScanner.scan(JzeroScanner.ord(">"));}
">="                   { return JzeroScanner.scan(Parser.GREATERTHANOREQUAL);}
"=="                   { return JzeroScanner.scan(Parser.ISEQUALTO);}
"!="                   { return JzeroScanner.scan(Parser.NOTEQUALTO);}
"&&"                   { return JzeroScanner.scan(Parser.LOGICALAND);}
"||"                   { return JzeroScanner.scan(Parser.LOGICALOR);}
"="                    { return JzeroScanner.scan(JzeroScanner.ord("=")); }
"+="                   { return JzeroScanner.scan(Parser.INCREMENT); }
"-="                   { return JzeroScanner.scan(Parser.DECREMENT); }
","                    { return JzeroScanner.scan(JzeroScanner.ord(",")); }
"."                    { return JzeroScanner.scan(JzeroScanner.ord(".")); }
{id}                   { return JzeroScanner.scan(Parser.IDENTIFIER); }
[0-9]+                 { return JzeroScanner.scan(Parser.INTLIT); }
[0-9]*"."[0-9]*([eE][+-]?[0-9]+)? { return JzeroScanner.scan(Parser.DOUBLELIT); }
([0-9]+)([eE][+-]?([0-9]+))  { return JzeroScanner.scan(Parser.DOUBLELIT); }
\"[^\"]*\"     { return JzeroScanner.scan(Parser.STRINGLIT); }
.              { JzeroScanner.lexErr("unrecognized character"); }