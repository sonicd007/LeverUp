// Step Event

// Check left track controls
if (keyboard_check(ord("Q"))) _left_accel = -3.0;
else if (keyboard_check(ord("W"))) _left_accel = -2.0;
else if (keyboard_check(ord("E"))) _left_accel = -1.0;
else if (keyboard_check(ord("R"))) _left_accel = 0.0; 
else if (keyboard_check(ord("T"))) _left_accel = 1.0;
else if (keyboard_check(ord("Y"))) _left_accel = 2.0;
else if (keyboard_check(ord("U"))) _left_accel = 3.0;

// Check right track controls
if (keyboard_check(ord("Z"))) _right_accel = -3.0;
else if (keyboard_check(ord("X"))) _right_accel = -2.0;
else if (keyboard_check(ord("C"))) _right_accel = -1.0;
else if (keyboard_check(ord("V"))) _right_accel = 0.0; 
else if (keyboard_check(ord("B"))) _right_accel = 1.0;
else if (keyboard_check(ord("N"))) _right_accel = 2.0;
else if (keyboard_check(ord("M"))) _right_accel = 3.0;


// Debug controls using the right side of the keyboard IJKL
if (keyboard_check(ord("I"))) _debug_accel = -6.0;
else if (keyboard_check(ord("K"))) _debug_accel = +6.0;
else {
	_debug_accel = 0;

}

if (keyboard_check(ord("J")))  {
	image_angle += 2.0
	image_angle = image_angle mod 360;
}
else if (keyboard_check(ord("L"))) {
	image_angle -= 2.0
	image_angle = image_angle mod 360;
}


//Tom's controller
_boat_accel = acceleration_constant * (_debug_accel - _left_accel - _right_accel);



_boat_x_speed += sin(image_angle / 57.2958) * _boat_accel;
_boat_y_speed += cos(image_angle / 57.2958) * _boat_accel;

	//Drag that slows down the boat speed over time, lower numbers = more drag
_boat_x_speed = _boat_x_speed * drag;
_boat_y_speed = _boat_y_speed * drag;

image_angle += turning_constant * ( _left_accel - _right_accel );
x += _boat_x_speed;
y += _boat_y_speed;

if (harpoon_cooldown > 0) {
    harpoon_cooldown -= 1; // Reduce cooldown
}

// Shoot Harpoon
if (!harpoon_active && harpoon_cooldown <= 0 && keyboard_check_pressed(vk_space)) {
    harpoon = instance_create_layer(x, y, "Instances", obj_harpoon); // Create harpoon
    harpoon.direction = image_angle;  // Set direction based on player facing angle
    harpoon_active = true;            // Activate harpoon
	harpoon_cooldown = harpoon_cooldown_interval;
}

// Check for active harpoon
if (harpoon_active && harpoon != noone) {
    // If harpoon hits a gator
    if (harpoon.target != noone) {
        target_gator = harpoon.target;
        target_gator.state = ENEMY_STATE.HOOKED; // Change gator to fleeing
        harpoon_timer = 300;  // 5 seconds to drag gator
    }
}

// Handle dragging logic
if (target_gator != noone) {
    // Move player erratically while dragging
    x += random_range(-1, 1);
    y += random_range(-1, 1);

    // Check if dragged to target location
    if (point_distance(target_gator.x, target_gator.y, drag_target_x, drag_target_y) < 32) {
        show_message("Gator successfully dragged!");
        reset_harpoon(); // Reset harpoon and states
    }

    // Check timer expiration
    harpoon_timer -= 1;
    if (harpoon_timer <= 0) {
        show_message("Gator broke free!");
        reset_harpoon(); // Reset harpoon and states
    }
}