%%
%int
%%
[a-zA-Z]+   { return Simple.scan(1); }
[0-9]+      { return Simple.scan(2); }
[ \t]+      { }
\r?\n       { Simple.increment_lineno(); }
.           { Simple.lexErr("unrecognized character"); }