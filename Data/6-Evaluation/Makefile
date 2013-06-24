include ../Makefile

Background.pdf: Background_ATLAS.log Background_CFS.log
Bodytrack_Alone.pdf: Bodytrack_Alone.tab
Bodytrack_Alone.tab: Bodytrack_Alone.log
Bodytrack_Fail.pdf: Bodytrack_ATLAS_Fail.log Bodytrack_ATLAS_Fail_Background.log Bodytrack_RT.log Bodytrack_RT_Background.log Bodytrack_RT_Fail.log Bodytrack_RT_Fail_Background.log
Bodytrack_Schedule.pdf: Bodytrack_Alone.log Bodytrack_ATLAS.log Bodytrack_ATLAS_Background.log Bodytrack_CFS.log Bodytrack_CFS_Background.log
Scheduling_Comparison_All.pdf: Scheduling_Comparison.tab
Scheduling_Comparison_ATLAS.pdf: Scheduling_Comparison.tab
Scheduling_Comparison.tab: $(foreach video,$(filter-out Sintel,$(VIDEOS_ALL)),$(foreach mode,CFS None Reduced Full,Scheduling_$(mode)_$(video).log))
Scheduling_Histogram.pdf: $(foreach mode,None Reduced Full,Scheduling_$(mode)_Hungergames.log)
Scheduling_Timeline.pdf: $(foreach mode,None Reduced Full,Scheduling_$(mode)_Hungergames.log)
UI_Worker_Alone.pdf: UI_Worker_CFS_Alone.log
UI_Worker_Schedule.pdf: UI_Worker_ATLAS_Alone.log UI_Worker_ATLAS_Load.log UI_Worker_CFS_Alone.log UI_Worker_CFS_Load.log
Values.val: Bodytrack_Alone.log

Bodytrack_Alone.lyx Scheduling_Comparison.lyx:
	@# ignore
