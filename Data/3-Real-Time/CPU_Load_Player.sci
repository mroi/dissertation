function String = cpu_load(Video)
	Log = read("CPU_Load_Player_" + Video + ".log", -1, 5);
	Stage_inp = Log(find(Log(:,1) == 0), 3);
	Stage_dec = Log(find(Log(:,1) == 1), 3);
	Stage_out = Log(find(Log(:,1) == 2), 3);
	
	// relative CPU load = time in thread / total cpu time
	Cpu = [];
	Cpu = [Cpu, max(Stage_inp)];
	Cpu = [Cpu, max(Stage_dec)];
	Cpu = [Cpu, max(Stage_out)];
	Cpu = Cpu ./ sum(Cpu);
	
	String = "";
	String = String + ascii(9) + string(Cpu(1));
	String = String + ascii(9) + string(Cpu(2));
	String = String + ascii(9) + string(Cpu(3));
endfunction

Result = [];
Result = [Result; "Black Swan" + cpu_load("Blackswan")];
Result = [Result; "Shore" + cpu_load("Shore")];
Result = [Result; "Park Run" + cpu_load("Parkrun")];
Result = [Result; "Rush Hour" + cpu_load("Rushhour")];
Result = [Result; "Hunger Games" + cpu_load("Hungergames")];

write("CPU_Load_Player.tab", Result);
exit;
