LLCM = read("Prediction_LLCM.log", -1, 2);
LLCM = LLCM(find(LLCM(:,2) > 0), :);
LLCM = abs(LLCM(:,1) ./ LLCM(:,2) - 1);

Result = [];
format(4);
Result = [Result; "LLCMPredictError" + ascii(9) + string(mean(LLCM)*100) + "\%"];

write("Values.val", Result);
exit;
