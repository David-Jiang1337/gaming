
var upkey = ord("W");
var leftkey = ord("A");
var rightkey = ord("D");
var downkey = ord("S");

//directions
var vMove = keyboard_check(rightkey)-keyboard_check(leftkey);
var hMove = keyboard_check(downkey)-keyboard_check(upkey);

//collision


//move
x+=movespeed*vMove;
y+=movespeed*hMove;

