/// @description Insert description here
// You can write your code in this editor

// Initialization
debug_text = "";
current_state = ENEMY_STATE.IDLE;
wander_dir = irandom(359);
speed = 2;                 // Movement speed
wander_timer = 0;          // Timer to change direction
wander_change_interval = 60; // Time (in frames) to pick a new direction

function wander_logic() {
	// Wandering Movement within Room Bounds

	// Timer Countdown
	wander_timer -= 1;

	// Change direction periodically
	if (wander_timer <= 0) {
	    wander_dir = irandom(359); // Pick a new random direction
	    wander_timer = wander_change_interval; // Reset the timer
	}

	// Set the object's motion
	direction = wander_dir;

	// Check for collisions with the room boundaries
	if (x <= 0) {
	    x = 1; // Keep within the left bound
	    wander_dir = irandom_range(0, 180); // Reflect direction to the right
	}
	if (x >= room_width) {
	    x = room_width - 1; // Keep within the right bound
	    wander_dir = irandom_range(180, 360); // Reflect direction to the left
	}
	if (y <= 0) {
	    y = 1; // Keep within the top bound
	    wander_dir = irandom_range(90, 270); // Reflect direction downward
	}
	if (y >= room_height) {
	    y = room_height - 1; // Keep within the bottom bound
	    wander_dir = irandom_range(-90, 90); // Reflect direction upward
	}
	
}