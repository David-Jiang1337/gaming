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

enum attackPhases {
	
}

global.unitArr = ds_list_create();

function clearArr(){
	ds_list_clear(global.unitArr);
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