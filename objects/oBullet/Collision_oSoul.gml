if (global.invframes <= 0) {
	audio_play_sound(sHurt, 1, false)
	global.invframes = 30;
	global.player_hp -= dmg;
	if (global.player_hp <= 0){
		game_end()
	}
}
if (disocon) {
	instance_destroy();
}