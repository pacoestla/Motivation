oPlayer.can_move = false;
if Event == 1 {
	Entry = instance_create_depth(cx + 24, cy + 173, -100000, oTextbox)
	Entry.text[0] = "*La peinture semble fraiche"
	Entry.text[1] = "«Où suis-je??»"
	Entry.text[2] = "*Il semble occupé à faire des croquis."
	Event = 2;
	alarm[0] =300;

}
if (Event == 3) {
	audio_pause_sound(sMusicMain)
	oZach.sprite_index = sZachTurn
	oZach.image_speed = 1
	oZach.image_index = 4
	if image_speed = 1
		oZach.image_speed = 0
	instance_create_depth(0,0, -99999, oTextbox)
	TextBox = instance_create_depth(cx + 24, cy + 173, -100000, oTextbox)
	TextBox.text[0] = "*..."
	TextBox.text[1] = "*..."
	TextBox.text[2] = "*Quand même gênant"
	TextBox.text[3] = "                                   sort"
	TextBox.speaker_sprite[0] = sZachBlase
	TextBox.speaker_sprite[1] = sZachBlase
	TextBox.speaker_sprite[2] = sZachNormal
	TextBox.speaker_sprite[3] = sZachNormal
	Event = 4;
}
if Event == 4 and !instance_exists(oTextbox) {
	oZach.image_speed = 0
	Event = 5
}
if Event ==5 {
	audio_resume_sound(sMusicMain)
	//oPlayer.can_move = true
	image_speed = 1
	}