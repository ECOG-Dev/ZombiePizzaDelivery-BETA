player_x= x
player_y= y

// sprint
if (keyboard_check(vk_shift)) {
	
	isrunning = true
    move_spd = 1;
    face = RUN;
} else {
	isrunning = false
    move_spd = 0.75;
}

sprite_index = sprite[face];
	
	//Movement

right_key = keyboard_check(ord("D"));
left_key = keyboard_check(ord("A"));
up_key = keyboard_check(ord("W"));
down_key = keyboard_check(ord("S"));

shift_key = keyboard_check(vk_shift);


xspd = (right_key - left_key) * move_spd;
yspd = (down_key - up_key) * move_spd;

// diagonal slowdown
if (xspd != 0 && yspd != 0) {
    xspd *= 0.7071;
    yspd *= 0.7071;
}

//wall collision
if place_meeting (x + xspd, y, obj_wall) == true 
{ 
	xspd = 0;
}

if place_meeting (x, y + yspd, obj_wall) == true 
{ 
	yspd = 0;
}

x += xspd;
y += yspd;

//set sprite (yes i know no direction anims)

if isrunning = false

{

if yspd == 0 

{
if xspd > 0 {face = WALK}
if xspd < 0 {face= WALK}
}
if xspd > 0 && face == WALK {face = WALK};
if xspd < 0 && face == WALK {face = WALK};

if xspd == 0

{
if yspd > 0 {face = WALK}
if yspd < 0 {face = WALK}
}
if yspd > 0 && face == WALK {face = WALK}
if yspd < 0 && face == WALK {face = WALK}

}

sprite_index= sprite[face]

//idle animate
if xspd == 0 && yspd == 0
{face = IDLE} 

sprite_index= sprite[face]