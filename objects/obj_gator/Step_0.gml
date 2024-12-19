/// @description Insert description here
// You can write your code in this editor

/* Gator behavior
* Gator will IDLE if no fish are near it or the enemy isn't near it
* Gator will WANDER if it has been idle for 5 seconds
* Gator will HUNT if fish within circle of detection
* Gator will FLEE if player has shot it

*/

switch self.current_state {
	case ENEMY_STATE.IDLE:
		debug_text = "IDLE";
		if (alarm[0] < 0)
		{
			alarm[0] = self.idle_state_transition_to_wandering_in_seconds	
		}
		// Reset speed as other states can change speed and transitions are going to idle currently
		speed = normal_speed;
		break;
	case ENEMY_STATE.WANDERING:
		debug_text = "WANDERING";
		wander_logic();
		check_for_fish();
		break;
	case ENEMY_STATE.HUNTING:
		debug_text = "HUNTING";
		hunt_fish();
		break;
	case ENEMY_STATE.FLEEING:
		debug_text = "FLEEING";
		// Calculate distance from player
		var dist_to_player = distance_to_point(obj_player.x, obj_player.y);
		
		if (dist_to_player > 400) {
			// If the gator is more than 100 pixels away from the player, transition to wandering
			self.current_state = ENEMY_STATE.WANDERING;
		} else {
			// Move erratically away from the player
			var flee_dir = point_direction(x, y, obj_player.x, obj_player.y) + 180;
			x += lengthdir_x(2, flee_dir);
			y += lengthdir_y(2, flee_dir);
		}
		break;
	case ENEMY_STATE.HOOKED:
	    debug_text = "HOOKED";
	    // Calculate distance from player
	    var dist_to_player = distance_to_point(obj_player.x, obj_player.y);

	    if (dist_to_player > 200) {
	        // If the gator is more than 200 pixels away, drag it towards the player
	        var drag_direction = point_direction(x, y, obj_player.x, obj_player.y);
	        x += lengthdir_x(2, drag_direction);
	        y += lengthdir_y(2, drag_direction);
	    } else {
	        // Apply resistance: move erratically within the 50px radius (away from the player)
	        var shake_strength = 4; // This can be adjusted to control the shaking force
	        var flee_dir = point_direction(x, y, obj_player.x, obj_player.y) + 180; // 180° to move away
	        x += lengthdir_x(shake_strength, flee_dir);
	        y += lengthdir_y(shake_strength, flee_dir);
	    }
    break;

	default:
		debug_text = "IDLE";
		break;
}