/// @description Insert description here
// You can write your code in this editor

/// Step Event: Fish Behavior


wander_timer -= 1; // Decrease the wander timer

// TODO: Work in progress on feat/enemy
//// Fleeing Logic: Detect nearby gators
//var nearest_gators = instance_place_list(x, y, fear_radius, obj_gator);
//if (array_length(nearest_gators) > 0) {
//    // If there are gators nearby, flee from all of them
//    var flee_x = 0;
//    var flee_y = 0;

//    // Loop through all nearby gators and calculate direction to flee
//    for (var i = 0; i < array_length(nearest_gators); i++) {
//        var gator = nearest_gators[i];
//        var delta_x = x - gator.x; // Direction away from the gator (x-axis)
//        var delta_y = y - gator.y; // Direction away from the gator (y-axis)
//        var distance = point_distance(x, y, gator.x, gator.y);

//        // Normalize direction vector (away from gator)
//        if (distance != 0) {
//            flee_x += delta_x / distance;
//            flee_y += delta_y / distance;
//        }
//    }

//    // Combine flee directions and set direction
//    var flee_dir = point_direction(0, 0, flee_x, flee_y);
//    direction = flee_dir; // Set direction to flee
//    speed = flee_speed;   // Increase speed when fleeing

//} else {
//    // If no gators are nearby, return to wandering behavior
//    speed = wander_speed;

//    // Change direction periodically
//    if (wander_timer <= 0) {
//        wander_dir = irandom(359); // Pick a new random direction
//        wander_timer = wander_interval; // Reset the timer
//    }
//    direction = wander_dir;
//}

//// Boundary Check: Keep fish inside the room
//if (x <= 0) x = 1;
//if (x >= room_width) x = room_width - 1;
//if (y <= 0) y = 1;
//if (y >= room_height) y = room_height - 1;
