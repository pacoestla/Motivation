if keyboard_check_pressed(ord("Z")) {
	global.PriorityBar += 1
	game_restart()
}
if (global.PriorityBar >= global.BarCount and !attacked) {
	alarm[0] = 1;
	attacked = true;
}