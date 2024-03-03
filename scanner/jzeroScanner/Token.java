public class Token {
    public int cat;
    public String text;
    public int lineno, colno, ival;
    String sval;
    double dval;

    private String deEscape(String sin) {
        String sout = "";
        sin = sin.substring(1,sin.length()-1);
        int i=0;
        while(sin.length() > 0) {
            char c = sin.charAt(0);
            if(c == '\\') {
                sin = sin.substring(1);
                if(sin.length() < 1) 
                    JzeroScanner.lexErr("malformed string literal");
                else {
                    c = sin.charAt(0);
                    switch(c) {
                    case 't': sout = sout + "\t"; break;
                    case 'n': sout = sout + "\n"; break; 
                    default: JzeroScanner.lexErr("unrecognized escape"); }
                }
            }
            else sout = sout + c; 
            sin = sin.substring(1);
        }
        return sout;
    }

    public Token(int c, String s, int ln, int col) { 
        cat = c; text = s; lineno = ln; colno = col; 
        switch (cat) {
            case Parser.INTLIT:
                ival = Integer.parseInt(s);
                break;
            case Parser.DOUBLELIT:
                dval = Double.parseDouble(s);
                break;
            case Parser.STRINGLIT:
                sval = deEscape(s);
                break; 
        }
    }
}
