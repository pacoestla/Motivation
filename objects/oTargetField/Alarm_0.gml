if (global.Damage > 0) {
	if (global.PlayerWeapon == "Stylet") {
		slice = instance_create_depth(global.Monster[0].x, 140, -10, oSlice)
		slice.alarm[0] = 45;
		global.Monster[0].alarm[1] = 60
		audio_play_sound(sSlash, 0, false)
	}
	global.Monster[0].alarm[1] = 60
}
else {
	global.Monster[0].alarm[1] = 1
	for (var i = 0; i < array_length(global.Monster); i++) {
		with (global.Monster[i]) {
			ReadyForBattle = true;
		}
	}
}