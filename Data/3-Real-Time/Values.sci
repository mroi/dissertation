stacksize(2E8);

RMS = read("RMS_Admission.tab", -1, 2);
RMS_Best = 1 - RMS(max(find(RMS(:,1) < 1/24)),2);

Result = [];
format(3);
Result = [Result; "RMSBestAdmission" + ascii(9) + string(RMS_Best*100) + "\%"];

write("Values.val", Result);
exit;
