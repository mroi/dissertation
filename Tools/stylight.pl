#!/usr/bin/perl -w

$weasels = "many|various|very|fairly|several|extremely\
	|exceedingly|quite|remarkably|few|surprisingly\
	|mostly|largely|huge|tiny|are a number|is a number\
	|excellent|interestingly|significantly\
	|substantially|clearly|vast|relatively|completely";

$irregulars = "awoken\
	|been|born|beat\
	|become|begun|bent\
	|beset|bet|bid\
	|bidden|bound|bitten\
	|bled|blown|broken\
	|bred|brought|broadcast\
	|built|burnt|burst\
	|bought|cast|caught\
	|chosen|clung|come\
	|cost|crept|cut\
	|dealt|dug|dived\
	|done|drawn|dreamt\
	|driven|drunk|eaten|fallen\
	|fed|felt|fought|found\
	|fit|fled|flung|flown\
	|forbidden|forgotten\
	|foregone|forgiven\
	|forsaken|frozen\
	|gotten|given|gone\
	|ground|grown|hung\
	|heard|hidden|hit\
	|held|hurt|kept|knelt\
	|knit|known|laid|led\
	|leapt|learnt|left\
	|lent|let|lain|lighted\
	|lost|made|meant|met\
	|misspelt|mistaken|mown\
	|overcome|overdone|overtaken\
	|overthrown|paid|pled|proven\
	|put|quit|read|rid|ridden\
	|rung|risen|run|sawn|said\
	|seen|sought|sold|sent\
	|set|sewn|shaken|shaven\
	|shorn|shed|shone|shod\
	|shot|shown|shrunk|shut\
	|sung|sunk|sat|slept\
	|slain|slid|slung|slit\
	|smitten|sown|spoken|sped\
	|spent|spilt|spun|spit\
	|split|spread|sprung|stood\
	|stolen|stuck|stung|stunk\
	|stridden|struck|strung\
	|striven|sworn|swept\
	|swollen|swum|swung|taken\
	|taught|torn|told|thought\
	|thrived|thrown|thrust\
	|trodden|understood|upheld\
	|upset|woken|worn|woven\
	|wed|wept|wound|won\
	|withheld|withstood|wrung\
	|written";

$biw = "as to whether|different than|is due to\
	|above|below|last|all of\
	|i'm|you're|he's|she's|it's|we're|they're\
	|i've|you've|we've|they've\
	|ain't|aren't|isn't|haven't|hasn't|let's\
	|ok|tho|thru|hw\
	|is comprised of\
	|work-around|best-effort|effort\
	|equals|impact|impacts|issue\
	|the reason is because|the fact that|though\
	|utilize|utilizes|utilizing|utilized|utilise|utilises|utilising|utilised\
	|, that\
	|after\\.|against\\.|at\\.|between\\.|for\\.|from\\.|in\\.|into\\.\
	|of\\.|on\\.|over\\.|through\\.|to\\.|under\\.|with\\.|without\\.\
	|milli|nano|pico|kilo|mega|giga\
	|\\(i\\. ?e\\.|\\(i\\.,e\\.|i\\. ?e\\.\
	|\\(e\\. ?g\\.|\\(e\\.,g\\.|e\\. ?g\\.\
	|etc\\.|et al\\.\
	|both|since|either,|can not|note,\
	|firstly|secondly\
	|\\. however|\\. therefore|\\. moreover|\\. additionally|. also,?\
	|one can|one has|one should\
	|the author|the authors|the reader\
	|this is|these are|this means that\
	|in order to|will likely be|some|thing|very|a lot of\
	|actually|in fact|truly|really\
	|center on|centers on|centered on|focus on|focuses on|focused on\
	|concentrate on|concentrates on|concentrated on\
	|as good or better than|in many cases|been the case that\
	|certainly|character|nature|factor|clever\
	|respective|respectively|sort of|oftentimes|ofttimes\
	|viewpoint|\\. while|, while|worth while|worthwhile";

while (<STDIN>) {
	s/(^|[[:space:]])($weasels)($|[[:space:]])/$1\\hl{$2}$3/g;
	s/(^|[[:space:]])(am|are|were|being|is|been|was|be)([[:space:]]+)(\w+ed|$irregulars)($|[[:space:]])/$1\\hl{$2$3$4}$5/g;
	s/(^|[[:space:]])($biw)($|[[:space:]])/$1\\hl{$2}$3/g;
	print $_;
}
