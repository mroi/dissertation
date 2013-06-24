stacksize(2E8);

Decode1 = read("Decoding_Times_Hungergames.log", -1, 1);
Decode2 = read("Decoding_Times_Hungergames_Repeat.log", -1, 1);
Decode_Repeat = correl(Decode1, Decode2, eye(Decode1 * Decode2'));

fd = mopen("Preprocess.log", "r");
Size = mfscanf(-1, fd, "%*s %u %u");
Size = geomean(Size(:,2) ./ Size(:,1)) - 1;
mclose(fd);

function Times = runtimes(Mode);
Times = [];
Times = [Times; read("Runtime_" + Mode + "_Blackswan.log", -1, 1)];
Times = [Times; read("Runtime_" + Mode + "_Shore.log", -1, 1)];
Times = [Times; read("Runtime_" + Mode + "_Parkrun.log", -1, 1)];
Times = [Times; read("Runtime_" + Mode + "_Charlie.log", -1, 1)];
Times = [Times; read("Runtime_" + Mode + "_Hungergames.log", -1, 1)];
endfunction
Times1 = runtimes("Before");
Times2 = runtimes("After");
Overhead = sum(Times2) / sum(Times1) - 1;
Overhead_IQR = iqr(Times2 ./ Times1);

Result = [];
format(7);
Result = [Result; "DecodeRepeatCorrelation" + ascii(9) + string(Decode_Repeat)];
format(4);
Result = [Result; "PreprocessSizeOverhead" + ascii(9) + string(Size*100) + "\%"];
Result = [Result; "PredictionOverhead" + ascii(9) + string(Overhead*100) + "\%"];
Result = [Result; "PredictionOverheadIQR" + ascii(9) + string(Overhead_IQR*100) + "\%"];

write("Values.val", Result);
exit;
