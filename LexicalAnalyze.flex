import java.util.ArrayList;

%%

%class LexicalAnalyze
%standalone

%{
	ArrayList <String> symt = new ArrayList<String>();
%}

operator = \+|\-|\*|\/|\=|\>|\>\=|\<|\<\=|\=\=|\+\+|\-\-
punctuation = \(|\)|\;
keyword = if|then|else|endif|while|do|endwhile|print|newline|read
integer = [\d]*
identifier = [a-zA-Z][a-zA-Z0-9]*
string = \"[^\"\n]*\"
comment = \/\*[\d\D]*\*\/|\/\/.*
white = [\s\t]*
error = \d+[a-zA-Z][a-zA-Z0-9]+
%%
{error}	{
	System.out.printf("Error : %s\n",yytext());
	System.exit(0);
}
{operator} {
	System.out.printf("Operator : %s\n",yytext());
}
{punctuation} {
	System.out.printf("Punctuation : %s\n",yytext());
}
{keyword} {
	System.out.printf("Keyword : %s\n",yytext());
}
{integer} {
	System.out.printf("Integer : %s\n",yytext());
}
{identifier} {
	if(symt.contains(yytext()))
		System.out.printf("Identifier %s already has in Symbol Table\n" + symt+"\n",yytext());
	else
		System.out.printf("New identifier : %s\n",yytext());
		symt.add(yytext());
}  
{string} {
	System.out.printf("String : %s\n",yytext());
} 
{comment} {

} 
{white} {

} 
. { 
	System.out.printf("Error : %s\n",yytext());
	System.exit(0);
}