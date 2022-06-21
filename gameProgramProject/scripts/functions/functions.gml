teamPos = [ //positions of friendly units
[256,288],
[256,488],
[256,128],
[256,608]
];

enemyPos = [
[960,256],
[960,512],
[1120,128],
[1120,384],
[1120,640]
];

function initCombat(teamArr, enemyArr){
	room_goto(room_combat);
	for(var i=0; i<array_length(teamArr); i++){
		var newUnit = instance_create_layer(teamPos[i][0],teamPos[i][1],"units",teamArr[i]);
		ds_list_add(global.unitArr, newUnit);
	}
	for(var i=0; i<array_length(enemyArr); i++){
		var newUnit = instance_create_layer(enemyPos[i][0],enemyPos[i][1],"units",enemyArr[i]);
		ds_list_add(global.unitArr, newUnit);
	}
}