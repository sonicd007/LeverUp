// Step Event

// Check left track controls
if (keyboard_check(ord("Q"))) _left_accel = -1.5;
else if (keyboard_check(ord("W"))) _left_accel = -1.0;
else if (keyboard_check(ord("E"))) _left_accel = -0.5;
else if (keyboard_check(ord("R"))) {
    _left_accel = 0.0; // Stop left track
    left_speed = 0;    // Ensure speed is set to zero
}
else if (keyboard_check(ord("T"))) _left_accel = 0.5;
else if (keyboard_check(ord("Y"))) _left_accel = 1.0;
else if (keyboard_check(ord("U"))) _left_accel = 1.5;

// Check right track controls
if (keyboard_check(ord("Z"))) _right_accel = -1.5;
else if (keyboard_check(ord("X"))) _right_accel = -1.0;
else if (keyboard_check(ord("C"))) _right_accel = -0.5;
else if (keyboard_check(ord("V"))) {
    _right_accel = 0.0; // Stop right track
    right_speed = 0;    // Ensure speed is set to zero
}
else if (keyboard_check(ord("B"))) _right_accel = 0.5;
else if (keyboard_check(ord("N"))) _right_accel = 1.0;
else if (keyboard_check(ord("M"))) _right_accel = 1.5;

// Adjust speeds based on acceleration
if (_left_accel != 0) {
    left_speed = clamp(left_speed + _left_accel * acceleration_rate, -max_skid_speed, max_skid_speed);
}

if (_right_accel != 0) {
    right_speed = clamp(right_speed + _right_accel * acceleration_rate, -max_skid_speed, max_skid_speed);
}

// Define track parameters
var _left_track_sprite_pos = 0 + 43 + 28.5;
var _right_track_sprite_pos = self.sprite_width - 43 - 28.5;
var _scaling_factor = 10;
var _track_distance = (_right_track_sprite_pos - _left_track_sprite_pos); // Distance between left and right tracks

// Tank velocities
var _v1 = left_speed;  // Left track velocity
var _v2 = right_speed; // Right track velocity

var _forward_speed = 0;

// Check if the tank is moving straight (both tracks have the same speed)
if (_v1 == _v2) {
    // Move forward in a straight line
    _forward_speed = _v1; // Since both speeds are equal, use either V1 or V2
} else {
    // Calculate angular velocity (omega)
    var _omega = (_v2 - _v1) / _track_distance;

    // Calculate forward speed (average of both tracks)
    _forward_speed = (_v1 + _v2) / 2;

    // Update rotation based on angular velocity (omega)
	// Pretty sure my issue is here although the tank pivoting over a small area could also be an issue.
    image_angle += _omega * _forward_speed * _scaling_factor;
	image_angle = image_angle mod 360;
}

// Update position based on average velocity
x += _forward_speed * cos(image_angle);
y += _forward_speed * sin(image_angle);