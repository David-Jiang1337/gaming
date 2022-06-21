maxHp = 20;
hp = 20;
unit = undefined;

unitSkills = [skills.attack, skills.defend];

selectable = true;

pointerArrow = instance_create_layer(x,y-48,"interface",ui_selectarrow);
pointerArrow.sprite_index = s_empty;

function takeDamage(damage){
	hp = clamp(hp-clamp(damage,0,2147483647),0,maxHp);
	
	if(hp<0){return true}
	processDeath();
}

function processDeath(){
	
}