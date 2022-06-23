draw_self();
if(!dead){
	draw_text(x,y,string(hp)+"/"+string(maxHp));
} else {
	draw_text(x,y,"Dead lmao");
}