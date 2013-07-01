function Error = forecast_error(Mode, Min, Step, Max)
	Log = read("Miss-Detect_" + Mode + ".log", -1, 3);
	Error = [];
	for i = Min:Step:(Max+Step)
		Filter = abs(Log(find((Log(:,2) >= i) & (Log(:,2) < (i + Step))), 3));
		if size(Filter, '*') == 0 then
			Error = [Error; 0 0 0];
		else
			Error_quart = quart(Filter);
			Error = [Error; mean(Filter) (mean(Filter) - Error_quart(1)) (Error_quart(3) - mean(Filter))];
		end
	end
endfunction

Min = -0.6;
Step = 0.025;
Max = 0;

Result = [Min:Step:Max]';
Result = [Result, forecast_error("None", Min, Step, Max)];
Result = [Result, forecast_error("Reduced", Min, Step, Max)];
Result = [Result, forecast_error("Full", Min, Step, Max)];

write("Miss-Detect_Forecast.tab", Result);
exit;
