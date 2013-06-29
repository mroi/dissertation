function String = relative_time(Video)
	Log = read("Times_Metrics_" + Video + ".log", -1, 20);
	
	// relative CPU load = time in thread / total cpu time
	Time = [];
	Time = [Time, mean(Log(:,15) ./ Log(:,20))];
	Time = [Time, mean(Log(:,16) ./ Log(:,20))];
	Time = [Time, mean(Log(:,17) ./ Log(:,20))];
	Time = [Time, mean(Log(:,18) ./ Log(:,20))];
	Time = [Time, mean(Log(:,19) ./ Log(:,20))];
	Time = [mean(1 - sum(Time,'c')), Time];
	
	String = "";
	String = String + ascii(9) + string(Time(1));
	String = String + ascii(9) + string(Time(2));
	String = String + ascii(9) + string(Time(3));
	String = String + ascii(9) + string(Time(4));
	String = String + ascii(9) + string(Time(5));
	String = String + ascii(9) + string(Time(6));
endfunction

Result = [];
Result = [Result; "Black Swan" + relative_time("Blackswan")];
Result = [Result; "Shore" + relative_time("Shore")];
Result = [Result; "Park Run" + relative_time("Parkrun")];
Result = [Result; "Hunger Games" + relative_time("Hungergames")];
Result = [Result; "Charlie" + relative_time("Charlie")];

write("Times_Relative.tab", Result);
exit;
