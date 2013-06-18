include ../Makefile

CASE_STUDY = Blackswan Hungergames Parkrun Rushhour Shore

Background_ATLAS.pdf: Background_ATLAS.log Background_CFS_nice-0.log
Background_CFS_nice.pdf: Background_CFS_nice-0.log Background_CFS_nice-5.log
Bodytrack_Alone.pdf: Bodytrack_Alone.tab
Bodytrack_Alone.tab: Bodytrack_Alone.log
Bodytrack_Fail.pdf: Bodytrack_ATLAS_Fail.log Bodytrack_ATLAS_Fail_Background.log Bodytrack_RT.log Bodytrack_RT_Background.log Bodytrack_RT_Fail.log Bodytrack_RT_Fail_Background.log
Bodytrack_Schedule.pdf: Bodytrack_Alone.log Bodytrack_ATLAS.log Bodytrack_ATLAS_Background.log Bodytrack_CFS.log Bodytrack_CFS_Background.log
CPU_Load_Player.pdf: CPU_Load_Player.tab
CPU_Load_Player.tab: $(foreach video,$(CASE_STUDY),CPU_Load_Player_$(video).log)
Decoding_Times.pdf: $(foreach video,$(CASE_STUDY),Decoding_Times_$(video).log)
Decoding_Times_Repeat.pdf: Decoding_Times_Hungergames.log Decoding_Times_Hungergames_Repeat.log
$(foreach step,Parsing Decompression Spatial Temporal Transform Post,Metrics_$(step).pdf) Metrics_Correlation.tab: $(foreach video,$(CASE_STUDY),Times_Metrics_$(video).log)
Prediction_Age.pdf: Prediction_Age.tab
Prediction_Age.tab: $(foreach age,Quick Normal Slow,$(foreach mode,None Reduced Full,Prediction_Age_$(age)_$(mode).log))
Prediction_Atom.pdf: Prediction_Atom.tab
Prediction_Atom.tab: $(foreach video,$(CASE_STUDY),$(foreach mode,None Reduced Full,Prediction_Atom_$(mode)_$(video).log))
Prediction_Column.pdf: Prediction_Column.tab
Prediction_Column.tab Prediction_Stability.pdf: $(foreach col,No_Drop Normal More_Drop,Prediction_Column_$(col).log)
Prediction_Comparison.pdf: Prediction_Comparison.tab
Prediction_Comparison.tab: $(foreach video,$(CASE_STUDY),$(foreach mode,None Reduced Full,Prediction_$(mode)_$(video).log))
Prediction_IO.pdf: Prediction_IO.tab
Prediction_IO.tab: $(foreach video,$(CASE_STUDY),Prediction_IO_$(video).log)
Prediction_Subsetting.pdf: Prediction_Subsetting.log
Prediction_Timeline.pdf: $(foreach mode,None Reduced Full,Prediction_$(mode)_Hungergames.log)
RMS_Admission.pdf: RMS_Admission.tab
RMS_Admission.tab: RMS_Admission.log
Scheduling_Comparison_All.pdf: Prediction_Comparison.tab
Scheduling_Comparison_ATLAS.pdf: Prediction_Comparison.tab
Scheduling_Comparison.tab: $(foreach video,$(VIDEOS_ALL),$(foreach mode,CFS None Reduced Full,Scheduling_$(mode)_$(video).log))
Scheduling_Histogram.pdf: $(foreach mode,None Reduced Full,Scheduling_$(mode)_Hungergames.log)
Scheduling_Timeline.pdf: $(foreach mode,None Reduced Full,Scheduling_$(mode)_Hungergames.log)
Times_Relative.pdf: Times_Relative.tab
Times_Relative.tab: $(foreach video,$(CASE_STUDY),Times_Metrics_$(video).log)
UI_Worker_Alone.pdf: UI_Worker_CFS_Alone.log
UI_Worker_Schedule.pdf: UI_Worker_ATLAS_Alone.log UI_Worker_ATLAS_Load.log UI_Worker_CFS_Alone.log UI_Worker_CFS_Load.log
Values.val: Bodytrack_Alone.log Decoding_Times_Hungergames.log Decoding_Times_Hungergames_Repeat.log Preprocess.log RMS_Admission.tab $(foreach video,$(CASE_STUDY),Runtime_After_$(video).log Runtime_Before_$(video).log)

Bodytrack_Alone.lyx CPU_Load_Player.lyx Prediction_Age.lyx Prediction_Atom.lyx Prediction_Column.lyx Prediction_Comparison.lyx Prediction_IO.lyx RMS_Admission.lyx Scheduling_Comparison.lyx Times_Relative.lyx:
	@# ignore

Prediction_Subsetting.pdf: Prediction_Subsetting.vsz
	veusz --export="$(basename $(realpath $<)).eps" "$(realpath $<)"
	pstopdf $(basename $<).eps $@
	rm $(basename $<).eps
	$(if $(REVIEW),open $@)
