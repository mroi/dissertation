function String = jitter_mode(Load, Mode)
	Interval = read("Scheduling_Load_" + Load + "_" + Mode + ".log", -1, 2);
	Jitter = abs(Interval(:,2) - (1/24));
	Jitter_quart = quart(Jitter);
	
	String = "";
	String = String + ascii(9) + string(mean(Jitter));
	String = String + ascii(9) + string(mean(Jitter) - Jitter_quart(1));
	String = String + ascii(9) + string(Jitter_quart(3) - mean(Jitter));
endfunction

function String = jitter(Load)
	String = "";
	String = String + jitter_mode(Load, "CFS");
	String = String + jitter_mode(Load, "None");
	String = String + jitter_mode(Load, "Reduced");
	String = String + jitter_mode(Load, "Full");
endfunction

Result = [];
Result = [Result; """5""" + jitter("Light")];
Result = [Result; """10""" + jitter("Normal")];
Result = [Result; """\infty""" + jitter("Max")];

write("Scheduling_Load.tab", Result);
exit;
