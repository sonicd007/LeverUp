/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_sprite_ext(spr_weapon, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_line((x - sprite_width / 2) + _left_track_sprite_pos, y, (x - sprite_width / 2) + _right_track_sprite_pos, y);