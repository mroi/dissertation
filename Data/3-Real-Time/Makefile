include ../Makefile

CASE_STUDY = Blackswan Hungergames Parkrun Rushhour Shore

Background_CFS_nice.pdf: Background_CFS_nice-0.log Background_CFS_nice-5.log
CPU_Load_Player.pdf: CPU_Load_Player.tab
CPU_Load_Player.tab: $(foreach video,$(CASE_STUDY),CPU_Load_Player_$(video).log)
Decoding_Times.pdf: $(foreach video,$(CASE_STUDY),Decoding_Times_$(video).log)
Decoding_Times_Repeat.pdf: Decoding_Times_Hungergames.log Decoding_Times_Hungergames_Repeat.log
$(foreach step,Parsing Decompression Spatial Temporal Transform Post,Metrics_$(step).pdf) Metrics_Correlation.tab: $(foreach video,$(CASE_STUDY),Times_Metrics_$(video).log)
RMS_Admission.pdf: RMS_Admission.tab
RMS_Admission.tab: RMS_Admission.log
Times_Relative.pdf: Times_Relative.tab
Times_Relative.tab: $(foreach video,$(CASE_STUDY),Times_Metrics_$(video).log)
Values.val: Decoding_Times_Hungergames.log Decoding_Times_Hungergames_Repeat.log RMS_Admission.tab

CPU_Load_Player.lyx RMS_Admission.lyx Times_Relative.lyx:
	@# ignore
