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
		break;
	case ENEMY_STATE.WANDERING:
		debug_text = "WANDERING";
		wander_logic();
		break;
	case ENEMY_STATE.HUNTING:
		debug_text = "HUNTING";
		break;
	case ENEMY_STATE.FLEEING:
		debug_text = "FLEEING";
		break;
	default:
		debug_text = "IDLE";
		break;
}