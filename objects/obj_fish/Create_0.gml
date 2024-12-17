/// @description Insert description here
// You can write your code in this editor

// Fish Variables
wander_speed = 2;    // Speed for aimless wandering
flee_speed = 4;      // Speed when fleeing gators
fear_radius = 150;   // Radius in which fish detects gators

// Wandering Behavior (Default State)
wander_dir = irandom(359); // Random initial direction
wander_timer = 0;          // Timer to change wander direction
wander_interval = 60;      // Change direction every 60 steps
