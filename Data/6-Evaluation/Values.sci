stacksize(2E8);

Bodytrack = read("Bodytrack_Alone.log", -1, 5);
BodytrackTime = mean(Bodytrack(2:$,5));

Result = [];
format(4);
Result = [Result; "BodytrackExecutionTime" + ascii(9) + string(BodytrackTime*1000) + "\,\mathrm{ms}"];

write("Values.val", Result);
exit;
