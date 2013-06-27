stacksize(2E8);

Bodytrack = read("Bodytrack_Alone.log", -1, 5);
BodytrackTime = mean(Bodytrack(2:$,5));

CFSLightInterval = read("Scheduling_Load_Light_CFS.log", -1, 2);
CFSLightJitter = mean(abs(CFSLightInterval(:,2) - (1/24)));

Result = [];
format(4);
Result = [Result; "BodytrackExecutionTime" + ascii(9) + string(BodytrackTime*1000) + "\,\mathrm{ms}"];
Result = [Result; "CFSLightLoadJitter" + ascii(9) + string(CFSLightJitter*1000) + "\,\mathrm{ms}"];

write("Values.val", Result);
exit;
