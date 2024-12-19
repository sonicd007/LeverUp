/// @description Fish behavior step event
wander_timer -= 1; // Decrease the wander timer

// Variables for fleeing behavior
var _flee_x = 0;
var _flee_y = 0;
var _gator_nearby = false;

// Loop through all gators in the game
// TODO: Optimize this as we shouldn't iterate through EVERY gator object.
with (obj_gator) {
    // Check if the gator is within the flee radius
    var _distance = point_distance(other.x, other.y, x, y);
    if (_distance <= other.flee_radius) {
        _gator_nearby = true;

        // Calculate flee vector (away from the gator)
        var _delta_x = other.x - x; // Direction away from the gator (x-axis)
        var _delta_y = other.y - y; // Direction away from the gator (y-axis)

        // Normalize direction vector
        if (_distance > 0) {
            _flee_x += -_delta_x / _distance;
            _flee_y += -_delta_y / _distance;
        }
    }
}

// Fleeing Logic: If gators are nearby
if (_gator_nearby) {
    // Combine flee directions and set direction
    var _flee_dir = point_direction(0, 0, _flee_x, _flee_y);
    direction = _flee_dir; // Set flee direction
    speed = flee_speed;   // Increase speed when fleeing
} else {
    // If no gators are nearby, return to wandering behavior
    speed = wander_speed;

    // Change direction periodically
    if (wander_timer <= 0) {
        wander_dir = irandom(359); // Pick a new random direction
        wander_timer = wander_interval; // Reset the timer
    }
    direction = wander_dir;
}

// Boundary Check: Keep fish inside the room
if (x <= 0) x = 1;
if (x >= room_width) x = room_width - 1;
if (y <= 0) y = 1;
if (y >= room_height) y = room_height - 1;
