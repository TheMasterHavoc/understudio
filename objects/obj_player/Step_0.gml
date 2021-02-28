/// @description  Move the player

if (global.cutscene == false) {
    if (global.left_hold) {
        facingTo = "LEFT";
        x -= moveSpeed;
        sprite_index = spriteLeft[inGenocide];
        image_speed = moveSpeed / 30;
    }
    if (global.right_hold) {
        facingTo = "RIGHT";
        x += moveSpeed;
        sprite_index = spriteRight[inGenocide];
        image_speed = moveSpeed / 30;
    }
    if (global.up_hold) {
        facingTo = "UP";
        y -= moveSpeed;
        sprite_index = spriteUp[inGenocide];
        image_speed = moveSpeed / 30;
    }
    if (global.down_hold) {
        facingTo = "DOWN";
        y += moveSpeed;
        sprite_index = spriteDown[inGenocide];
        image_speed = moveSpeed / 30;
    }
}

if (x == xprevious) && (y == yprevious) {
    image_speed = 0;
    image_index = 0;
}

depth = -y;

/// Collision System

if (global.cutscene == false) {
    if (global.left_hold) && (place_meeting(x - moveSpeed, y, obj_solid_parent)) {
        x += moveSpeed;
    }
    if (global.right_hold) && (place_meeting(x + moveSpeed, y, obj_solid_parent)) {
        x -= moveSpeed;
    }
    if (global.up_hold) && (place_meeting(x, y - moveSpeed, obj_solid_parent)) {
        y += moveSpeed;
    }
    if (global.down_hold) && (place_meeting(x, y + moveSpeed, obj_solid_parent)) {
        y -= moveSpeed;
    }
    
    if (place_meeting(x - moveSpeed, y - moveSpeed, obj_slope_dl)) {
        if (global.left_hold)
            y -= moveSpeed;
        
        if (global.down_hold)
            x += moveSpeed;
    }
    if (place_meeting(x + moveSpeed, y - moveSpeed, obj_slope_dr)) {
        if (global.right_hold)
            y -= moveSpeed;
        
        if (global.down_hold)
            x -= moveSpeed;
    }
    if (place_meeting(x - moveSpeed, y + moveSpeed, obj_slope_ul)) {
        if (global.left_hold)
            y += moveSpeed;
        
        if (global.up_hold)
            x += moveSpeed;
    }
    if (place_meeting(x + moveSpeed, y + moveSpeed, obj_slope_ur)) {
        if (global.right_hold)
            y += moveSpeed;
        
        if (global.up_hold)
            x -= moveSpeed;
    }
}

/// C-Menu

if (global.menu) && (global.cutscene == false) {
    keyboard_clear(vk_lcontrol);
    keyboard_clear(ord("C"));
    
    if (!instance_exists(obj_cmenu)) {
        instance_create(0, 0, obj_cmenu);
    }
}

/// Debug System

if (global.debug == true) {
    if (keyboard_check_pressed(ord("V"))) {
        if (instance_exists(obj_solid_parent)) {
            with (obj_solid_parent) {
                visible = !visible;
            }
        }
        if (instance_exists(obj_slope_dl)) {
            with (obj_slope_dl) {
                visible = !visible;
            }
        }
        if (instance_exists(obj_slope_dr)) {
            with (obj_slope_dr) {
                visible = !visible;
            }
        }
        if (instance_exists(obj_slope_ul)) {
            with (obj_slope_ul) {
                visible = !visible;
            }
        }
        if (instance_exists(obj_slope_ur)) {
            with (obj_slope_ur) {
                visible = !visible;
            }
        }
    }
}

