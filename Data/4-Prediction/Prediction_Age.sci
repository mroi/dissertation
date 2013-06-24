function String = accuracy_mode(Aging, Mode)
	Decode = read("Prediction_Age_" + Aging + "_" + Mode + ".log", -1, 2);
	Decode = Decode(find(Decode(:,2) > 0), :);
	Decode = abs(Decode(:,1) ./ Decode(:,2) - 1);
	Decode_quart = quart(Decode);
	
	String = "";
	String = String + ascii(9) + string(mean(Decode));
	String = String + ascii(9) + string(mean(Decode) - Decode_quart(1));
	String = String + ascii(9) + string(Decode_quart(3) - mean(Decode));
endfunction

function String = accuracy(Aging)
	String = "";
	String = String + accuracy_mode(Aging, "None");
	String = String + accuracy_mode(Aging, "Reduced");
	String = String + accuracy_mode(Aging, "Full");
endfunction

Result = [];
Result = [Result; """0.1""" + accuracy("Quick")];
Result = [Result; """0.01""" + accuracy("Normal")];
Result = [Result; """0.001""" + accuracy("Slow")];

write("Prediction_Age.tab", Result);
exit;
