A = read("RMS_Admission.log", -1, 1);
A = gsort(A, 'r', 'i');

// cut off the top 1% as potential outliers
Length = floor(size(A, 'r') * 0.99);
A = A(1:Length);

Misses = 1 - (1/Length : 1/Length : 1)';
Result = [[0 1]; [A Misses]];

write("RMS_Admission.tab", Result);
exit;
