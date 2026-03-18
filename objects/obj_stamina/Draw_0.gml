if (instance_exists(obj_player) && stamina_alpha > 0.01) {

    // Position relative to player
    var px = obj_player.x - 14; // x position (left of player)
    var py = obj_player.y - 16;  // y position (above player)

    // How wide the stamina bar is (0 to 1 based on stamina)
    var scale_x = clamp(global.stamina / global.staminamax, 0, 0.5);

    // How tall the stamina bar is
    var scale_y = 0.5;

    // ---------------- BACKGROUND BAR ----------------
    draw_sprite_ext(
        spr_backstamina,  // 1) sprite to draw
        1,                // 2) sub-image/frame of sprite
        px,               // 3) x position in the room
        py,               // 4) y position in the room
        0.5,                // 5) xscale (width multiplier)
        0.5,                // 6) yscale (height multiplier)
        0,                // 7) rotation in degrees
        c_white,          // 8) color tint
        stamina_alpha     // 9) transparency (0 = invisible, 1 = fully visible)
    );

    // ---------------- FRONT (FILL) BAR ----------------
    draw_sprite_ext(
        spr_frontstamina, // 1) sprite
        1,                // 2) sub-image
        px,               // 3) x position
        py,               // 4) y position
        scale_x,          // 5) width scaled by stamina
        scale_y,          // 6) height scale
        0,                // 7) rotation
        c_white,          // 8) color
        stamina_alpha     // 9) transparency
    );

}