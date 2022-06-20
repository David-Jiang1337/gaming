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

function initCombat(){
	room_goto(room_combat);
}