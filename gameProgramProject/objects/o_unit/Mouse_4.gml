if(selectable){
	var targetIndex = ds_list_find_index(global.targets, id);
	if(targetIndex == -1){ //not currently targeted
		ds_list_add(global.targets, id); //add to list of targets
	} else {
		ds_list_delete(global.targets, targetIndex); //remove from list of targets
	}
	
	if(ds_list_size(global.targets) >= global.maxTargets){
		resolveAction();
	}
}