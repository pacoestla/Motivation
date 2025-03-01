if keyboard_check(vk_left) {
	x -= global.soul_speed
}
if keyboard_check(vk_right) {
	x += global.soul_speed
}
if keyboard_check(vk_down) {
	y += global.soul_speed
}
if keyboard_check(vk_up) {
	y -= global.soul_speed
}
if (global.invframes > 0) {
	global.invframes -= 1;
	image_speed = 1;
}
else {
	image_speed = 0;
	image_index = 0;
}