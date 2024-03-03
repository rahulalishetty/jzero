import java.io.FileReader;
public class JzeroScanner {
   static Yylex lex;
   public static int yylineno, yycolno;
   public static Token yylval, last_token;
   public static void main(String argv[]) throws Exception {
      lex = new Yylex(new FileReader(argv[0]));
      yylineno = yycolno = 1;
      int i;
      while ((i=lex.yylex()) != Yylex.YYEOF) {
        System.out.println("token " + i + ":" + yylineno + " " + yytext());
      }
    }
    public static String yytext() {
        return lex.yytext();
    }
    public static void lexErr(String s) {
        System.err.println(s + ": line " + yylineno + ": " + yytext());
        System.exit(1);
    }
    public static int scan(int cat) {
        last_token = yylval = new Token(cat, yytext(), yylineno, yycolno);
        yycolno += yytext().length();
        return cat;
    }
    public static void newline() {
        yylineno++; yycolno = 1;
    }
    public static void whitespace() {
        yycolno += yytext().length();
    }
    public static void comment() {
        int i, len;
        String s = yytext();
        len = s.length();
        for(i=0; i<len; i++)
	    if (s.charAt(i)=='\n') { 
            yylineno++; yycolno=1; 
        } else yycolno++;
    }
   public static short ord(String s) { return (short)(s.charAt(0)); }
}