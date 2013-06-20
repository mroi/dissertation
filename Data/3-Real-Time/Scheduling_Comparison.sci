function String = jitter_mode(Video, Mode, Fps)
	Interval = read("Scheduling_" + Mode + "_" + Video + ".log", -1, 2);
	Jitter = abs(Interval(:,2) - (1/Fps));
	Jitter_quart = quart(Jitter);
	
	String = "";
	String = String + ascii(9) + string(mean(Jitter));
	String = String + ascii(9) + string(mean(Jitter) - Jitter_quart(1));
	String = String + ascii(9) + string(Jitter_quart(3) - mean(Jitter));
endfunction

function String = jitter(Video, Fps)
	String = "";
	String = String + jitter_mode(Video, "CFS", Fps);
	String = String + jitter_mode(Video, "None", Fps);
	String = String + jitter_mode(Video, "Reduced", Fps);
	String = String + jitter_mode(Video, "Full", Fps);
endfunction

Result = [];
Result = [Result; """Black Swan""" + jitter("Blackswan", 24)];
Result = [Result; """Shore""" + jitter("Shore", 25)];
Result = [Result; """Park Run""" + jitter("Parkrun", 50)];
Result = [Result; """Charlie""" + jitter("Charlie", 25)];
Result = [Result; """Hunger Games""" + jitter("Hungergames", 24)];
Result = [Result; """Rear Window""" + jitter("Rearwindow", 50)];

write("Scheduling_Comparison.tab", Result);
exit;
