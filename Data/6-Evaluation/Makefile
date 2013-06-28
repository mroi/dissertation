include ../Makefile

Background.pdf: Background_ATLAS.log Background_CFS.log
Bodytrack_Alone.pdf: Bodytrack_Alone.tab
Bodytrack_Alone.tab: Bodytrack_Alone.log
Bodytrack_Fail.pdf: Bodytrack_ATLAS_Fail.log Bodytrack_ATLAS_Fail_Background.log Bodytrack_RT.log Bodytrack_RT_Background.log Bodytrack_RT_Fail.log Bodytrack_RT_Fail_Background.log
Bodytrack_Schedule.pdf: Bodytrack_Alone.log Bodytrack_ATLAS.log Bodytrack_ATLAS_Background.log Bodytrack_CFS.log Bodytrack_CFS_Background.log
Decoding_Times.pdf: $(foreach video,$(filter-out Sintel,$(VIDEOS_ALL)),Decoding_Times_$(video).log)
Scheduling_Comparison_All.pdf: Scheduling_Comparison.tab
Scheduling_Comparison_ATLAS.pdf: Scheduling_Comparison.tab
Scheduling_Comparison.tab: $(foreach video,$(filter-out Sintel,$(VIDEOS_ALL)),$(foreach mode,CFS None Reduced Full,Scheduling_$(mode)_$(video).log))
Scheduling_Deadline.pdf: Scheduling_Deadline.tab
Scheduling_Deadline.tab: $(foreach deadline,Early Late,$(foreach mode,None Reduced Full,Scheduling_Deadline_$(deadline)_$(mode).log))
Scheduling_Histogram.pdf: $(foreach mode,None Reduced Full,Scheduling_$(mode)_Hungergames.log)
Scheduling_Oversubscribe.pdf: Scheduling_Oversubscribe.tab
Scheduling_Oversubscribe.tab: $(foreach jobs,Precise Normal MSE,$(foreach mode,None Reduced Full,Scheduling_Oversubscribe_$(jobs)_$(mode).log))
Scheduling_Load.pdf: Scheduling_Load.tab
Scheduling_Load.tab: $(foreach load,Light Normal Max,$(foreach mode,None Reduced Full CFS,Scheduling_Load_$(load)_$(mode).log))
Scheduling_Timeline.pdf: $(foreach mode,None Reduced Full,Scheduling_$(mode)_Hungergames.log)
UI_Worker_Alone.pdf: UI_Worker_CFS_Alone.log
UI_Worker_Schedule.pdf: UI_Worker_ATLAS_Alone.log UI_Worker_ATLAS_Load.log UI_Worker_CFS_Alone.log UI_Worker_CFS_Load.log
Values.val: Bodytrack_Alone.log Scheduling_Load_Light_CFS.log

Bodytrack_Alone.lyx Scheduling_Comparison.lyx Scheduling_Deadline.lyx Scheduling_Load.lyx Scheduling_Oversubscribe.lyx:
	@# ignore
