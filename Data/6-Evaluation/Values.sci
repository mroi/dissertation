stacksize(2E8);

Bodytrack = read("Bodytrack_Alone.log", -1, 5);
BodytrackTime = mean(Bodytrack(2:$,5));

CFSLightInterval = read("Scheduling_Load_Light_CFS.log", -1, 2);
CFSLightJitter = mean(abs(CFSLightInterval(:,2) - (1/24)));

UIWorkerTime = read("UI_Worker_CFS_Alone.log", -1, 3);
UIWorkerTime = UIWorkerTime(:,3);

Result = [];
format(4);
Result = [Result; "BodytrackExecutionTime" + ascii(9) + string(BodytrackTime*1000) + "\,\mathrm{ms}"];
Result = [Result; "CFSLightLoadJitter" + ascii(9) + string(CFSLightJitter*1000) + "\,\mathrm{ms}"];
Result = [Result; "UIWorkerTimeMin" + ascii(9) + string(min(UIWorkerTime)*1000)];
Result = [Result; "UIWorkerTimeMax" + ascii(9) + string(max(UIWorkerTime)*1000)];

write("Values.val", Result);
exit;
