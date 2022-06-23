maxHp = 20;
hp = 20;
unit = undefined;
dead = false;

unitSkills = [skills.attack, skills.heal, skills.attack, skills.heal];

selectable = false;

pointerArrow = instance_create_layer(x,y-48,"interface",ui_selectarrow);
pointerArrow.sprite_index = s_empty;

function takeDamage(value){
	hp = clamp(hp-clamp(value,0,2147483647),0,maxHp);
	
	if(hp>0){return true}
	processDeath();
}

function heal(value){
	hp = clamp(hp+clamp(value,0,2147483647), 0, maxHp);
}

function processDeath(){
	ds_list_delete(global.unitArr, ds_list_find_index(global.unitArr, id));
	dead = true;
}