function correlation = pearson(Times, Metrics)
	columns = size(Metrics, 'c');
	[Q,R] = qr([Metrics Times], 'e');
	x = R(1:columns,1:columns) \ R(1:columns,columns+1);
	Estimate = Metrics * x;
	Estimate = Estimate - mean(Estimate);
	Times = Times - mean(Times);
	correlation = sum(Estimate .* Times) / (sqrt(sum(Estimate^2)) * sqrt(sum(Times^2)));
endfunction

Log = [];
Log = [Log; read("Times_Metrics_Blackswan.log", -1, 20)];
Log = [Log; read("Times_Metrics_Hungergames.log", -1, 20)];
Log = [Log; read("Times_Metrics_Parkrun.log", -1, 20)];
Log = [Log; read("Times_Metrics_Rushhour.log", -1, 20)];
Log = [Log; read("Times_Metrics_Shore.log", -1, 20)];

Result = [""; "t"; "b"; ""; ""; ""; ""; ""; ""; "tb"];
Result = Result + ascii(9) + ["right"; " "; "Step"; "parsing"; "decompression"; "spatial"; "temporal"; "transform"; "post"; "complete decode"];

format(5);
Weight = [];
Weight = [Weight; 1 - sum(Log(:,15:19)) / sum(Log(:,20))];
Weight = [Weight; sum(Log(:,15)) / sum(Log(:,20))];
Weight = [Weight; sum(Log(:,16)) / sum(Log(:,20))];
Weight = [Weight; sum(Log(:,17)) / sum(Log(:,20))];
Weight = [Weight; sum(Log(:,18)) / sum(Log(:,20))];
Weight = [Weight; sum(Log(:,19)) / sum(Log(:,20))];
Result = Result + ascii(9) + ["right"; "Relative"; "Execution Time"; ("$" + string(100*Weight) + "\%$"); "$100\%$"];

format(6);
Local = [];
Local = [Local; pearson(Log(:,20) - sum(Log(:,15:19), 'c'), Log(:,2:4))];  // Parsing
Local = [Local; pearson(Log(:,15), Log(:,3:4))];  // Decompression
Local = [Local; pearson(Log(:,16), Log(:,5:7))];  // Spatial
Local = [Local; pearson(Log(:,17), Log(:,8:10))];  // Temporal
Local = [Local; pearson(Log(:,18), Log(:,11:13))];  // Transform
Local = [Local; pearson(Log(:,19), Log(:,14))];  // Post
Result = Result + ascii(9) + ["right"; "Selected Metrics"; "Regression"; ("$" + string(Local) + "$"); "—"];

format(6);
Global = [];
Global = [Global; pearson(Log(:,20) - sum(Log(:,15:19), 'c'), Log(:,2:14))];  // Parsing
Global = [Global; pearson(Log(:,15), Log(:,2:14))];  // Decompression
Global = [Global; pearson(Log(:,16), Log(:,2:14))];  // Spatial
Global = [Global; pearson(Log(:,17), Log(:,2:14))];  // Temporal
Global = [Global; pearson(Log(:,18), Log(:,2:14))];  // Transform
Global = [Global; pearson(Log(:,19), Log(:,2:14))];  // Post
Global = [Global; pearson(Log(:,20), Log(:,2:14))];  // Complete
Result = Result + ascii(9) + ["right"; "Global"; "Regression"; ("$" + string(Global) + "$")];

write("Metrics_Correlation.tab", Result);
exit;
