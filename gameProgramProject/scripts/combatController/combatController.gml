enum skills {
	attack,
	heal
}

enum units {
	team,
	enemy,
	both
}

global.teamPos = [ //positions of friendly units
[256,288],
[256,448],
[256,128],
[256,608]
];

global.enemyPos = [
[960,256],
[960,512],
[1120,128],
[1120,384],
[1120,640]
];

global.unitArr = ds_list_create();
global.currentController = undefined;
global.unitTurn = 0; //index of unit whose turn it is
global.currentAction = undefined;
global.targets = ds_list_create();
global.maxTargets = 0;



function clearArr(){
	ds_list_clear(global.unitArr);
}

function standby(){
	//create buttons for each ability
	var currentUnit = ds_list_find_value(global.unitArr, global.unitTurn);
	var unitSkills = currentUnit.unitSkills;
	if(currentUnit.unit = units.team){ //friendly unit interface
		for(var i=0; i<array_length(unitSkills); i++){
			var button = instance_create_layer(64+(i*224), 708, "interface", ui_actionButton);
			button.image_xscale = 6;
			button.image_yscale = 2;
			switch(unitSkills[i]){
				case skills.attack:
					button.text = "Attack";
					button.action = skills.attack;
					break;
				case skills.heal:
					button.text = "Heal";
					button.action = skills.heal;
					break;
			}
		}
	}else if(currentUnit.unit = units.enemy){
		beginAction(skills.attack);	//enemies can only attack for simplicity sake
	}
}

function beginAction(action){ //action should be an enum from 'skills'
	var currentUnit = ds_list_find_value(global.unitArr, global.unitTurn);
	//deletes action buttons
	with ui_actionButton {
		instance_destroy();	
	}
	
	//switch case
	global.currentAction = action;
	switch(global.currentAction){
		case skills.attack:
			global.maxTargets = 1;
			makeSelectable(units.enemy);
			break;
		case skills.heal:
			global.maxTargets = 1;
			makeSelectable(units.team);
			break;
		
	}
	
	//enemy action select and resolve
	
	if(currentUnit.unit == units.enemy){
		//create temporary unit arr
		var tempUnitArr = ds_list_create();
		ds_list_copy(tempUnitArr, global.unitArr);
		//select targets
		with o_unit {
			if(!selectable){
				ds_list_delete(tempUnitArr, ds_list_find_index(tempUnitArr, id));	
			}
		}
		ds_list_shuffle(tempUnitArr);
		for(var i=0; i<global.maxTargets; i++){
			ds_list_add(global.targets, ds_list_find_value(tempUnitArr, i));
			
		}
		resolveAction();
		
	}
	
}

function cancelAction(){ //emergency action cancel
	//clears all variables involved with actions
	clearSelectable();
	global.maxTargets = 0;
	global.currentAction = undefined;
	ds_list_clear(global.targets);
	
	//returns to standby phase
	standby();
}

function resolveAction(){
	clearSelectable();
	
	//applies actions to targets
	for(var i=0; i<ds_list_size(global.targets); i++){
		var currentUnit = ds_list_find_value(global.targets, i);
		with currentUnit {
			switch(global.currentAction){
				case skills.attack:
					takeDamage(10);
					break;
				case skills.heal:
					heal(5);
					break;
			}
		}
	}
	
	//advances turn
	global.unitTurn++;
	if(global.unitTurn >= ds_list_size(global.unitArr)){global.unitTurn = 0;}
	
	//clears all variables involved with actions
	global.maxTargets = 0;
	global.currentAction = undefined;
	ds_list_clear(global.targets);
	
	//checks if a team has won
	var teamCount = 0;
	var enemyCount = 0;
	for(var i=0; i<ds_list_size(global.unitArr); i++){
		var currentUnit = ds_list_find_value(global.unitArr, i);
		if(currentUnit.unit == units.team){teamCount++;}
		if(currentUnit.unit == units.enemy){enemyCount++;}
	}
	if(teamCount <= 0){
		//enemy win event
		
		//exiting combat
		exitCombat();
		return 0;
	}else if(enemyCount <= 0){
		//team win event
		
		//exiting combat
		exitCombat();
		return 0;
	}
	
	//begin a new turn if previous turn did not end the game
	standby();
}

function initCombat(teamArr, enemyArr){
	for(var i=0; i<array_length(teamArr); i++){
		var newUnit = instance_create_layer(global.teamPos[i,0],global.teamPos[i,1],"units",teamArr[i]);
		ds_list_add(global.unitArr, newUnit);
	}
	for(var i=0; i<array_length(enemyArr); i++){
		var newUnit = instance_create_layer(global.enemyPos[i,0],global.enemyPos[i,1],"units",enemyArr[i]);
		ds_list_add(global.unitArr, newUnit);
	}
}

function exitCombat(){
	global.unitTurn = 0;
	clearArr();
	room_goto(room_overworld);
}


function makeSelectable(unitType){
	var currentUnit = ds_list_find_value(global.unitArr, global.unitTurn);
	if(currentUnit.unit == units.team){
		with o_unit{
			if((unit == unitType || unitType == units.both || unit == units.both)&&ds_list_find_index(global.unitArr, id)!=-1){
				selectable = true;	
			}
		}
	} else {
		with o_unit{
			if((unit != unitType || unitType == units.both || unit == units.both)&&ds_list_find_index(global.unitArr, id)!=-1){
				selectable = true;	
			}
		}
	}
}

function clearSelectable(){
	with o_unit{
		selectable = false;	
	}
}
