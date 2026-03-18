event_inherited();
xspd = 0;
yspd = 0; 

// Movement
xspd = 0;
yspd = 0;
move_spd = 0.75;
walk_spd = 0.75;
run_spd = 1.25;

// Stamina
global.stamina = 150;
global.staminamax = 150;

// Status
isrunning = false;
in_air = false; // <-- this is the key fix

// Z axis
z = 0;
zspd = 0;
jSpd = 1.75;
grav = 0.1;

// Floor level
floorlvl = 1;

// Sprites
sprite[IDLE] = spr_playeridle;
sprite[WALK] = spr_playerwalk;
sprite[RUN] = spr_playerrun;
face = WALK;