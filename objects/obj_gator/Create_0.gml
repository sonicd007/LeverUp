/// @description Insert description here
// You can write your code in this editor

// Initialization
debug_text = "";
current_state = ENEMY_STATE.IDLE;
wander_dir = irandom(359);
speed = normal_speed;                 // Movement speed
wander_timer = 0;          // Timer to change direction

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

function check_for_fish() {
    // Check if any fish are within the hunt radius
    var fish_nearby = false;

	// TODO: Optimize as we shouldn't loop through ALL fish in the room
	// Loop through all fish objects using `with`
    with (obj_fish) {
        // Calculate distance from the enemy to the current fish
        var distance = point_distance(other.x, other.y, x, y);

        // If the fish is within the hunt radius, set it as the target
        if (distance <= other.hunt_radius) {
            other.target_prey = id; // `id` refers to the current fish in the `with` block
			fish_nearby = true;
            break; // Exit loop once a target is found
        }
    }

    // If a fish is nearby, change state to HUNTING
    if (fish_nearby) {
        current_state = ENEMY_STATE.HUNTING;
        debug_text = "HUNTING";
    }
}
	
function hunt_fish() {
    // If there is no target fish, switch back to IDLE
    if (target_prey == noone || !instance_exists(target_prey)) {
        current_state = ENEMY_STATE.IDLE;
        return;
    }

    // Move toward the target fish
    var target_dir = point_direction(x, y, target_prey.x, target_prey.y);
    direction = target_dir;
    speed = hunt_speed; // Faster speed when hunting

    // Check if the fish is "caught" (within a small radius)
    if (point_distance(x, y, target_prey.x, target_prey.y) <= 10) {
        // Catch the fish and destroy it
		instance_destroy(target_prey);
        target_prey = noone;
        current_state = ENEMY_STATE.IDLE; // Return to IDLE after catching the fish
        debug_text = "CAUGHT FISH";
    }
}
