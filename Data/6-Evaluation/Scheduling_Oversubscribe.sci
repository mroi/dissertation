function String = jitter_mode(Oversubscribe, Mode)
	Interval = read("Scheduling_Oversubscribe_" + Oversubscribe + "_" + Mode + ".log", -1, 2);
	Jitter = abs(Interval(:,2) - (1/24));
	Jitter_quart = quart(Jitter);
	
	String = "";
	String = String + ascii(9) + string(mean(Jitter));
	String = String + ascii(9) + string(mean(Jitter) - Jitter_quart(1));
	String = String + ascii(9) + string(Jitter_quart(3) - mean(Jitter));
endfunction

function String = jitter(Oversubscribe)
	String = "";
	String = String + jitter_mode(Oversubscribe, "None");
	String = String + jitter_mode(Oversubscribe, "Reduced");
	String = String + jitter_mode(Oversubscribe, "Full");
endfunction

Result = [];
Result = [Result; """None""" + jitter("Precise")];
Result = [Result; """2.5%""" + jitter("Normal")];
Result = [Result; """MSE""" + jitter("MSE")];

write("Scheduling_Oversubscribe.tab", Result);
exit;
