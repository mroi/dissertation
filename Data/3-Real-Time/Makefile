include ../Makefile

CASE_STUDY = Blackswan Hungergames Parkrun Rushhour Shore

Background_CFS_nice.pdf: Background_CFS_nice-0.log Background_CFS_nice-5.log
CPU_Load_Player.pdf: CPU_Load_Player.tab
CPU_Load_Player.tab: $(foreach video,$(CASE_STUDY),CPU_Load_Player_$(video).log)
Decoding_Times.pdf: $(foreach video,$(CASE_STUDY),Decoding_Times_$(video).log)
RMS_Admission.pdf: RMS_Admission.tab
RMS_Admission.tab: RMS_Admission.log
Values.lyx: Decoding_Times_Hungergames.log Decoding_Times_Hungergames_Repeat.log RMS_Admission.tab

CPU_Load_Player.lyx RMS_Admission.lyx:
	@# ignore
