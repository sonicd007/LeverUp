// Create Event

// Skid steer accelerations and speeds
_left_accel = 0;
_right_accel = 0;
left_speed = 0;
right_speed = 0;

// Motion settings
max_skid_speed = 5;
acceleration_rate = 0.2; // How quickly speed changes
deceleration_rate = 0.1; // How quickly speed slows down

// Tank orientation
image_angle = 90
// Define track parameters
_left_track_sprite_pos = 0 + 43 + 28.5;
_right_track_sprite_pos = self.sprite_width - 43 - 28.5;
_scaling_factor = 10;
_track_distance = (_right_track_sprite_pos - _left_track_sprite_pos); // Distance between left and right tracks