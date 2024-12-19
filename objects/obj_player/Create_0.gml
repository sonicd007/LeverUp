// Create Event

// Skid steer accelerations and speeds
_left_accel = 0;
_right_accel = 0;
left_speed = 0;
right_speed = 0;

// Motion settings
drag = 0.99; //lower numbers = more drag
acceleration_constant = 0.05 // adjusts how twitchy acceleration and decelleration is, bigger = faster acceleration
turning_constant = 0.5 // adjusts how twitchy turning is, bigger = tictchier turning

_boat_x_speed = 0;
_boat_y_speed = 0;
_boat_accel = 0;
_debug_accel = 0;

// Tank orientation
image_angle = 0;

// weapon properties
harpoon_cooldown = 0;    // Tracks cooldown time
harpoon_cooldown_interval = 60;
harpoon_active = false;  // Tracks if the harpoon is currently active
harpoon = noone;         // Reference to the harpoon instance
target_gator = noone;    // Reference to the gator hit by the harpoon
harpoon_timer = 0;       // Timer for dragging the gator
drag_target_x = 400;     // Example drag target X-coordinate
drag_target_y = 300;     // Example drag target Y-coordinate

// Reset harpoon and state
function reset_harpoon() {
    if (harpoon != noone) instance_destroy(harpoon);
    harpoon = noone;
    target_gator = noone;
    harpoon_active = false;
    harpoon_cooldown = 60; // 1 second cooldown
}