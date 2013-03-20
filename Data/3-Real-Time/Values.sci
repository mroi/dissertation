stacksize(2E8);

RMS = read("RMS_Admission.tab", -1, 2);
RMS_Best = 1 - RMS(max(find(RMS(:,1) < 1/24)),2);

Decode1 = read("Decoding_Times_Hungergames.log", -1, 1);
Decode2 = read("Decoding_Times_Hungergames_Repeat.log", -1, 1);
Decode_Repeat = correl(Decode1, Decode2, eye(Decode1 * Decode2'));

Result = [];
format(3);
Result = [Result; "RMSBestAdmission" + ascii(9) + string(RMS_Best*100) + "\%"];
format(6);
Result = [Result; "DecodeRepeatCorrelation" + ascii(9) + string(Decode_Repeat)];

write("Values.val", Result);
exit;
