right_key = keyboard_check(vk_right) or keyboard_check(ord("D"));
up_key = keyboard_check(vk_up) or keyboard_check(ord("W"));
left_key = keyboard_check(vk_left) or keyboard_check(ord("A"));
down_key = keyboard_check(vk_down) or keyboard_check(ord("S"));

//Camera Movement
cx = camera_get_view_x(view_camera[0])
cy = camera_get_view_y(view_camera[0])

//x = cx + xDifference
//y = cy + yDifference

//Movement
xspd = (right_key - left_key) * move_spd;
yspd = (down_key - up_key) * move_spd;

if instance_exists(oCutSceneInterdit) {
	if oCutSceneInterdit.Event == 5 {
		move_towards_point( 6, 173, 1 )
		image_speed = 1
		object_set_sprite(oPlayer, sPlayerRight)
		alarm[0] = 10
	}
}

//Collision
if place_meeting(x+xspd, y, oWall){
	xspd = 0;
}
if place_meeting(x, y+yspd, oWall){
	yspd = 0;
}

if keyboard_check(vk_shift) {
	move_spd = run_spd
} else{
	move_spd = walk_spd;
}



if(can_move){
//Animate
	if xspd > 0 {
			sprite_index = sPlayerRight;
	} else if xspd < 0 {
		sprite_index = sPlayerLeft;
	} else if yspd > 0 {
			sprite_index = sPlayerDown;
	} else if yspd < 0 {
		sprite_index = sPlayerUp;
	}

	if(xspd != 0 or yspd != 0){
		image_speed = 1;
	} else {
		image_speed = 0;
		image_index = 0;
	}

	x += xspd;
	y += yspd;
}