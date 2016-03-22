///ground_state
if (!place_meeting(x, y+1, Solid)) {
    vspd += grav;
    
    // Player is in the air
    sprite_index = spr_P1_move;
    image_speed = 0;
    image_index = (vspd > 0);
    
    // Control the jump height
    if (up_release && vspd < -6) {
        vspd = -6;
    }
} else {
    vspd = 0;
    
    // Jumping code
    if (up) {
        vspd = -16;
        //audio_play_sound(snd_jump, 5, false);
    }
    
    // Player is on the ground
    if (hspd == 0) {
        sprite_index = spr_P1_idle;
        image_speed = .01;
    } else {
        sprite_index = spr_P1_move;
        image_speed = .1;
    }
}

if (right || left) {
    hspd += (right-left)*acc;
    hspd_dir = right - left;
    
    if (hspd > spd) hspd = spd;
    if (hspd < -spd) hspd = -spd;
} else {
    apply_friction(acc);
}

if (hspd != 0) {
    image_xscale = sign(hspd);
}

move(Solid);
