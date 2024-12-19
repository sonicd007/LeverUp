/// @description Insert description here
// You can write your code in this editor

// Wandering Behavior (Default State)
wander_dir = irandom(359); // Random initial direction
wander_timer = 0;          // Timer to change wander direction
wander_interval = 60;      // Change direction every 60 steps
gator_list = ds_list_create();