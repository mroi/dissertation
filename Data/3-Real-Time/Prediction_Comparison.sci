function String = accuracy_mode(Video, Mode)
	if isdef("Prefix") then Mode = Prefix + "_" + Mode; end
	
	Decode = read("Prediction_" + Mode + "_" + Video + ".log", -1, 2);
	Decode = Decode(find(Decode(:,2) > 0), :);
	Decode = abs(Decode(:,1) ./ Decode(:,2) - 1);
	Decode_quart = quart(Decode);
	
	String = "";
	String = String + ascii(9) + string(mean(Decode));
	String = String + ascii(9) + string(mean(Decode) - Decode_quart(1));
	String = String + ascii(9) + string(Decode_quart(3) - mean(Decode));
endfunction

function String = accuracy(Video)
	String = "";
	String = String + accuracy_mode(Video, "None");
	String = String + accuracy_mode(Video, "Reduced");
	String = String + accuracy_mode(Video, "Full");
endfunction

Result = [];
Result = [Result; """Black Swan""" + accuracy("Blackswan")];
Result = [Result; """Shore""" + accuracy("Shore")];
Result = [Result; """Park Run""" + accuracy("Parkrun")];
Result = [Result; """Rush Hour""" + accuracy("Rushhour")];
Result = [Result; """Hunger Games""" + accuracy("Hungergames")];

if isdef("Prefix") then
	write("Prediction_" + Prefix + ".tab", Result);
else
	write("Prediction_Comparison.tab", Result);
end
exit;
