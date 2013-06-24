function String = accuracy(Mode)
	Decode = read("Prediction_Column_" + Mode + ".log", -1, 2);
	Decode = Decode(find(Decode(:,2) > 0), :);
	Decode = abs(Decode(:,1) ./ Decode(:,2) - 1);
	Decode_quart = quart(Decode);
	
	String = "";
	String = String + ascii(9) + string(median(Decode));
	String = String + ascii(9) + string(median(Decode) - Decode_quart(1));
	String = String + ascii(9) + string(Decode_quart(3) - median(Decode));
endfunction

Result = [];
Result = [Result; """No Drop""" + accuracy("No_Drop")];
Result = [Result; """1.1""" + accuracy("Normal")];
Result = [Result; """1.2""" + accuracy("More_Drop")];

write("Prediction_Column.tab", Result);
exit;
