format(5);
Log = read("Characteristics.log", -1, 5);
Stage_inp = Log(find(Log == 1), 2:5);
Stage_dec = Log(find(Log == 2), 2:5);
Stage_out = Log(find(Log == 4), 2:5);

Result = [];
Result = [Result; "input & low load, input-bound"];
Result = [Result; "decoder & high and dynamic load"];
Result = [Result; "output & low load, most time-critical"];

// CPU load = time_in_thread / total runtime
Cpu = [];
Cpu = [Cpu; max(Stage_inp(:,2)) / (max(Stage_inp(:,1)) - min(Stage_inp(:,1)))];
Cpu = [Cpu; max(Stage_dec(:,2)) / (max(Stage_dec(:,1)) - min(Stage_dec(:,1)))];
Cpu = [Cpu; max(Stage_out(:,2)) / (max(Stage_out(:,1)) - min(Stage_out(:,1)))];
Result = Result + (" & $" + string(100*Cpu) + "\%$");

// interquartile range
Iqr = [];
Iqr = [Iqr; iqr(Stage_inp(:,3))];
Iqr = [Iqr; iqr(Stage_dec(:,3))];
Iqr = [Iqr; iqr(Stage_out(:,3))];
Result = Result + (" & $" + string(1000*Iqr) + "\,\mathrm{ms}$");

// average slack
Slack = [];
Slack = [Slack; mean(Stage_inp(:,4))];
Slack = [Slack; mean(Stage_dec(:,4))];
Slack = [Slack; mean(Stage_out(:,4))];
Result = Result + (" & $" + string(1000*Slack) + "\,\mathrm{ms}$");

write("Characteristics.tex", Result);
exit;
