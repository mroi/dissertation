stacksize(2E8);

RMS = read("RMS_Admission.tab", -1, 2);
RMS_Best = 1 - RMS(max(find(RMS(:,1) < 1/24)),2);

Decode1 = read("Decoding_Times_Hungergames.log", -1, 1);
Decode2 = read("Decoding_Times_Hungergames_Repeat.log", -1, 1);
Decode_Repeat = correl(Decode1, Decode2, eye(Decode1 * Decode2'));

fd = mopen("Preprocess.log", "r");
Size = mfscanf(-1, fd, "%*s %u %u");
Size = geomean(Size(:,2) ./ Size(:,1)) - 1;
mclose(fd);

Result = [];
format(3);
Result = [Result; "RMSBestAdmission" + ascii(9) + string(RMS_Best*100) + "\%"];
format(7);
Result = [Result; "DecodeRepeatCorrelation" + ascii(9) + string(Decode_Repeat)];
format(4);
Result = [Result; "PreprocessSizeOverhead" + ascii(9) + string(Size*100) + "\%"];

write("Values.val", Result);
exit;
