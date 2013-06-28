function String = jitter_mode(Deadline, Mode)
	Interval = read("Scheduling_Deadline_" + Deadline + "_" + Mode + ".log", -1, 2);
	Jitter = abs(Interval(:,2) - (1/24));
	Jitter_quart = quart(Jitter);
	
	String = "";
	String = String + ascii(9) + string(mean(Jitter));
	String = String + ascii(9) + string(mean(Jitter) - Jitter_quart(1));
	String = String + ascii(9) + string(Jitter_quart(3) - mean(Jitter));
endfunction

function String = jitter(Deadline)
	String = "";
	String = String + jitter_mode(Deadline, "None");
	String = String + jitter_mode(Deadline, "Reduced");
	String = String + jitter_mode(Deadline, "Full");
endfunction

Result = [];
Result = [Result; """Early""" + jitter("Early")];
Result = [Result; """Late""" + jitter("Late")];

write("Scheduling_Deadline.tab", Result);
exit;
