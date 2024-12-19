/// @description Insert description here
// You can write your code in this editor
draw_self();
//draw_sprite_ext(spr_weapon, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
if (target_gator != noone) {
    // Draw rope
    draw_line_color(x, y, target_gator.x, target_gator.y, c_white, c_gray);
}