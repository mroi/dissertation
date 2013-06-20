function String = accuracy(Video)
	Log = read("Prediction_IO_" + Video + ".log", -1, 3);
	Input  = Log(find((Log(:,1) == 0) & (Log(:,3) ~= 0)), 2:3);
	Output = Log(find((Log(:,1) == 1) & (Log(:,3) ~= 0)), 2:3);
	
	// ignore the last input job - it only detects the EOF and is thus unfairly overpredicted
	Input = Input(1:(size(Input, 'r') - 1), :);
	
	Input = abs(Input(:,1) ./ Input(:,2) - 1);
	Output = abs(Output(:,1) ./ Output(:,2) - 1);
	Input_quart  = quart(Input);
	Output_quart = quart(Output);
	
	String = "";
	String = String + ascii(9) + string(mean(Input));
	String = String + ascii(9) + string(mean(Input) - Input_quart(1));
	String = String + ascii(9) + string(Input_quart(3) - mean(Input));
	String = String + ascii(9) + string(mean(Output));
	String = String + ascii(9) + string(mean(Output) - Output_quart(1));
	String = String + ascii(9) + string(Output_quart(3) - mean(Output));
endfunction

Result = [];
Result = [Result; """Black Swan""" + accuracy("Blackswan")];
Result = [Result; """Shore""" + accuracy("Shore")];
Result = [Result; """Park Run""" + accuracy("Parkrun")];
Result = [Result; """Charlie""" + accuracy("Charlie")];
Result = [Result; """Hunger Games""" + accuracy("Hungergames")];

write("Prediction_IO.tab", Result);
exit;
