Bodytrack = read("Bodytrack_Alone.log", -1, 5);
Bodytrack_mean = [mean(Bodytrack(11:$,4)); mean(Bodytrack(2:$,5))];
Bodytrack_quart = [quart(Bodytrack(11:$,4))'; quart(Bodytrack(2:$,5))'];

Result = [Bodytrack_mean, Bodytrack_mean - Bodytrack_quart(:,1), Bodytrack_quart(:,3) - Bodytrack_mean];
write("Bodytrack_Alone.tab", Result);
exit;
