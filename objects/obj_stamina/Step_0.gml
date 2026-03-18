// show bar when stamina used
if (global.stamina < global.staminamax) {
    stamina_show = 30; // 2 seconds at 60fps
}

// countdown
if (stamina_show > 0) {
    stamina_show--;
}

if (stamina_show > 0) {
    stamina_alpha = lerp(stamina_alpha, 1, 0.05);
} else {
    stamina_alpha = lerp(stamina_alpha, 0, 0.05);
}