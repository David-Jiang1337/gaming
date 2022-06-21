maxHp = 20;
hp = 20;
unit = undefined;

unitSkills = [skills.attack, skills.defend];

selectable = false;

pointerArrow = instance_create_layer(x,y-24,"interface",ui_selectarrow);
pointerArrow.sprite_index = undefined;

function takeDamage(damage){
	hp = clamp(hp-clamp(damage,0,2147483647),0,maxHp);
	
	if(hp<0){return true}
	processDeath();
}

function processDeath(){
	
}