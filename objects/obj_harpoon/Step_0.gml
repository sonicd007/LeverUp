/// @description Insert description here
// You can write your code in this editor

// Check for collision with gator
with (obj_gator) {
    if (place_meeting(x, y, other)) {
        other.target = id;    // Mark this harpoon as hitting the gator
        other.speed = 0;      // Stop harpoon movement
		self.current_state = ENEMY_STATE.HOOKED; // Set the gator to hooked state
		// Hide the hook once it has a target
		other.visible = false;
        exit;                 // Stop checking other gators
    }
}



// Destroy harpoon if it moves offscreen
if (x < 0 || x > room_width || y < 0 || y > room_height) {
    instance_destroy();
}