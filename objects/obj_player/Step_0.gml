player_x= x
player_y= y

show_debug_message(floorlvl);


	//inputs

right_key = keyboard_check(ord("D"));
left_key = keyboard_check(ord("A"));
up_key = keyboard_check(ord("W"));
down_key = keyboard_check(ord("S"));

shift_key = keyboard_check(vk_shift);
input_jump = keyboard_check_pressed(vk_space);
input_jump_hold = keyboard_check(vk_space);

//floor level

if (z = 0)

floorlvl = 1

if place_meeting(x, y, obj_floor_lvl2)

floorlvl = 2

if place_meeting(x, y, obj_floor_lvl3)

floorlvl = 3

if place_meeting(x, y, obj_floor_lvl4)

floorlvl = 4

if place_meeting(x, y, obj_floor_lvl5)

floorlvl = 5

if place_meeting(x, y, obj_floor_lvl6)

floorlvl = 6

// movement with air control
if (z == 0) {
    // on ground
    xspd = (right_key - left_key) * move_spd;
    yspd = (down_key - up_key) * move_spd;
} else {
    // in air (less control)
    xspd = (right_key - left_key) * (move_spd * 1.5);
    yspd = (down_key - up_key) * (move_spd * 1.5);
}

// diagonal slowdown
if (xspd != 0 && yspd != 0) {
    xspd *= 0.7071;
    yspd *= 0.7071;
}

// jump + gravity

// gravity
if (zspd < 0 && !input_jump_hold) {
    zspd += grav * 1.5; // cut jump short
} else {
    zspd += grav;
}

// jump (only when on ground)
if (z == 0 && input_jump && global.stamina > 0) {
    zspd = -jSpd;  // UP is negative
	
	global.stamina -= 10; //stamina cost
}

// apply vertical movement
z += zspd;

// ground check
if (z > 0) {
    z = 0;
    zspd = 0;
}

// sprint
if (shift_key && global.stamina > 0 && (xspd != 0 || yspd != 0)) {
    
    global.stamina -= 1;
    move_spd = run_spd;

} else {
    
    move_spd = walk_spd;
}

// stamina regen
if (!shift_key){

    global.stamina += 0.35;

    if (global.stamina > 150) {
        global.stamina = 150;
    }

    if (global.stamina < 0) {
        global.stamina = 0;
    }
}

sprite_index = sprite[face];
	

//wall collision
if place_meeting (x + xspd, y, obj_wall_lvl1) == true 
{ 
	xspd = 0;
}

if place_meeting (x, y + yspd, obj_wall_lvl1) == true 
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