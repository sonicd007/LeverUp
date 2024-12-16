// Step Event

// Check left track controls
if (keyboard_check(ord("Q"))) _left_accel = 1.5;
else if (keyboard_check(ord("W"))) _left_accel = 1.0;
else if (keyboard_check(ord("E"))) _left_accel = 0.5;
else if (keyboard_check(ord("R"))) {
    _left_accel = 0.0; // Stop left track
    left_speed = 0;    // Ensure speed is set to zero
}
else if (keyboard_check(ord("T"))) _left_accel = -0.5;
else if (keyboard_check(ord("Y"))) _left_accel = -1.0;
else if (keyboard_check(ord("U"))) _left_accel = -1.5;

// Check right track controls
if (keyboard_check(ord("Z"))) _right_accel = 1.5;
else if (keyboard_check(ord("X"))) _right_accel = 1.0;
else if (keyboard_check(ord("C"))) _right_accel = 0.5;
else if (keyboard_check(ord("V"))) {
    _right_accel = 0.0; // Stop right track
    right_speed = 0;    // Ensure speed is set to zero
}
else if (keyboard_check(ord("B"))) _right_accel = -0.5;
else if (keyboard_check(ord("N"))) _right_accel = -1.0;
else if (keyboard_check(ord("M"))) _right_accel = -1.5;

// Adjust speeds based on acceleration
if (_left_accel != 0) {
    left_speed = clamp(left_speed + _left_accel * acceleration_rate, -max_skid_speed, max_skid_speed);
}

if (_right_accel != 0) {
    right_speed = clamp(right_speed + _right_accel * acceleration_rate, -max_skid_speed, max_skid_speed);
}

// Tank velocities
var _v1 = left_speed;  // Left track velocity
var _v2 = right_speed; // Right track velocity

show_debug_message("Left: " + string(_v1) + " Right: " + string(_v2));

var _forward_speed = 0;

if (abs(_v1 - _v2) < 0.001) { // Check if speeds are approximately equal
    _forward_speed = _v1;     // Both speeds are equal, so use one track's speed
    x += _forward_speed * cos(degtorad(image_angle));
    y += _forward_speed * sin(degtorad(image_angle));
} else {
    // Angular velocity and rotational movement logic
    var _omega = (_v2 - _v1) / _track_distance;

    // Calculate forward speed (average of both tracks)
    _forward_speed = (_v1 + _v2) / 2;

    // Update rotation
    image_angle += _omega * _scaling_factor;
    image_angle = image_angle mod 360;

    // Update position based on forward speed
    x += _forward_speed * cos(degtorad(image_angle));
    y += _forward_speed * sin(degtorad(image_angle));
	
	show_debug_message("Omega: " + string(_omega));
	show_debug_message("Image Angle: " + string(image_angle));
}
