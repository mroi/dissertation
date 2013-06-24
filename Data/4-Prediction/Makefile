include ../Makefile

CPU_Load_Player.pdf: CPU_Load_Player.tab
CPU_Load_Player.tab: $(foreach video,$(VIDEOS_SELECT),CPU_Load_Player_$(video).log)
Decoding_Times.pdf: $(foreach video,$(VIDEOS_SELECT),Decoding_Times_$(video).log)
Decoding_Times_Repeat.pdf: Decoding_Times_Hungergames.log Decoding_Times_Hungergames_Repeat.log
$(foreach step,Parsing Decompression Spatial Temporal Transform Post,Metrics_$(step).pdf) Metrics_Correlation.tab: $(foreach video,$(VIDEOS_SELECT),Times_Metrics_$(video).log)
Prediction_Age.pdf: Prediction_Age.tab
Prediction_Age.tab: $(foreach age,Quick Normal Slow,$(foreach mode,None Reduced Full,Prediction_Age_$(age)_$(mode).log))
Prediction_Atom.pdf: Prediction_Atom.tab
Prediction_Atom.tab: Prediction_Comparison.sci $(foreach video,$(VIDEOS_SELECT),$(foreach mode,None Reduced Full,Prediction_Atom_$(mode)_$(video).log))
Prediction_Column.pdf: Prediction_Column.tab
Prediction_Column.tab Prediction_Stability.pdf: $(foreach col,No_Drop Normal More_Drop,Prediction_Column_$(col).log)
Prediction_Comparison.pdf: Prediction_Comparison.tab
Prediction_Comparison.tab: $(foreach video,$(VIDEOS_ALL),$(foreach mode,None Reduced Full,Prediction_$(mode)_$(video).log))
Prediction_IO.pdf: Prediction_IO.tab
Prediction_IO.tab: $(foreach video,$(VIDEOS_SELECT),Prediction_IO_$(video).log)
Prediction_Subsetting.pdf: Prediction_Subsetting.log
Prediction_Timeline.pdf: $(foreach mode,None Reduced Full,Prediction_$(mode)_Hungergames.log)
Times_Relative.pdf: Times_Relative.tab
Times_Relative.tab: $(foreach video,$(VIDEOS_SELECT),Times_Metrics_$(video).log)
Values.val: Decoding_Times_Hungergames.log Decoding_Times_Hungergames_Repeat.log Preprocess.log $(foreach video,$(VIDEOS_ALL),Runtime_After_$(video).log Runtime_Before_$(video).log)

CPU_Load_Player.lyx Prediction_Age.lyx Prediction_Atom.lyx Prediction_Column.lyx Prediction_Comparison.lyx Prediction_IO.lyx Times_Relative.lyx:
	@# ignore

Prediction_Subsetting.pdf: Prediction_Subsetting.vsz
	veusz --export="$(basename $(realpath $<)).eps" "$(realpath $<)"
	pstopdf $(basename $<).eps $@
	rm $(basename $<).eps
	$(if $(REVIEW),open $@)
