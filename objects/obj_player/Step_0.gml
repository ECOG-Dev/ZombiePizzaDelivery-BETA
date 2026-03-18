// Player position for debugging
player_x = x;
player_y = y;
show_debug_message(in_air);

// Inputs
var right_key = keyboard_check(ord("D"));
var left_key  = keyboard_check(ord("A"));
var up_key    = keyboard_check(ord("W"));
var down_key  = keyboard_check(ord("S"));

var shift_key       = keyboard_check(vk_shift);
var input_jump      = keyboard_check_pressed(vk_space);
var input_jump_hold = keyboard_check(vk_space);

// Floor detection
floorlvl = 1;
if (place_meeting(x, y + 1, obj_floor_lvl2)) floorlvl = 2;
if (place_meeting(x, y + 1, obj_floor_lvl3)) floorlvl = 3;
if (place_meeting(x, y + 1, obj_floor_lvl4)) floorlvl = 4;
if (place_meeting(x, y + 1, obj_floor_lvl5)) floorlvl = 5;
if (place_meeting(x, y + 1, obj_floor_lvl6)) floorlvl = 6;

// Movement
if (z == 0) {
    in_air = false;
    xspd = (right_key - left_key) * move_spd;
    yspd = (down_key - up_key) * move_spd;
} else {
    in_air = true;
    xspd = (right_key - left_key) * (move_spd * 1.5);
    yspd = (down_key - up_key) * (move_spd * 1.5);
}

// Diagonal movement correction
if (xspd != 0 && yspd != 0) {
    xspd *= 0.7071;
    yspd *= 0.7071;
}

// Sprint and stamina
if (shift_key && global.stamina > 0 && (xspd != 0 || yspd != 0)) {
    global.stamina -= 1;
    move_spd = run_spd;
} else {
    move_spd = walk_spd;
}

if (!shift_key) {
    global.stamina += 0.35;
    global.stamina = clamp(global.stamina, 0, global.staminamax);
}

// Jump or drop
if (z == 0 && input_jump && global.stamina > 0) {
    var can_drop = (floorlvl > 1);
    if (can_drop) {
        floorlvl -= 1;
        z = -1;
    } else {
        zspd = -jSpd;
        global.stamina -= 10;
    }
}

// Gravity
if (zspd < 0 && !input_jump_hold) {
    zspd += grav * 1.5;
} else {
    zspd += grav;
}
z += zspd;

// Ground check
if (z > 0) {
    z = 0;
    zspd = 0;
}

// Wall collisions
var inst = instance_place(x + xspd, y, par_wall); // horizontal collision
if (inst != noone && inst.floorlvl == floorlvl) {
    xspd = 0;
}

inst = instance_place(x, y + yspd, par_wall); // vertical collision
if (inst != noone && inst.floorlvl == floorlvl) {
    yspd = 0;
}
// Apply movement
x += xspd;
y += yspd;

// Sprite handling
if (xspd != 0 || yspd != 0) {
    face = WALK;
} else {
    face = IDLE;
}
sprite_index = sprite[face];