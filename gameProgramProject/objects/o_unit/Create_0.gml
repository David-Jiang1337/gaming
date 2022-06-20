maxHp = 20;
hp = 20;
unit = undefined;

unitSkills = [skills.attack, skills.defend];

selected = false;

function takeDamage(damage){
	hp = clamp(hp-clamp(damage,0,2147483647),0,maxHp);
	
	if(hp<0){return true}
	processDeath();
}

function processDeath(){
	
}