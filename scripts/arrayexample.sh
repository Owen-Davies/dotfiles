function FUNCtst() { 
	declare -gA astr; 
	astr=([a]="1k" [b]="2k" [c]="1234"); 
	#astr+=([potato]="1234");	
declare -p astr;
	printf "blah\n"
};

FUNCtst | dmenu;

declare -p astr
 
echo ${astr[a]};
echo ${astr[c]};
echo ${astr[potato]};
