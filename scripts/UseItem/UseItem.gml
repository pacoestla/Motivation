function UseItem(itemNum){
	var StartingHP = global.player_hp;
	var Healed = false
	var ItemKeep = false
	var PrevArmor = "";
	var PrevWeapon = "";
	
	var border_l = 320 - (oBulletBoard.current_width / 2)
	var border_u = 384 - (oBulletBoard.current_height)
	
	global.Monster[0].Dialogue = instance_create_depth(border_l + 30, border_u +25, 0, oTextElement)
	global.Monster[0].Dialogue.CanAdvance = true;
	
	if (global.Item[itemNum] == "DEC") {
		global.player_hp += 20
		global.Monster[0].Dialogue.TextQueue[0] = "* Vous finissez votre DEC";
		global.Monster[0].Dialogue.TextQueue[1] = "* Vos habiletés augmentent&* + 4 ATK";
		global.player_attack += 4;
	}
	if (global.Item[itemNum] == "Blender") {
		global.player_hp += 10
		global.Monster[0].Dialogue.TextQueue[0] = "* Vous apprenez Blender";
		global.Monster[0].Dialogue.TextQueue[1] = "* NAD reconnait vos habiletés";
		global.Monster[0].Dialogue.TextQueue[2] = "* NAD perd 5 DEF";
		global.Monster[0].Defense -= 5
	}
	if (global.Item[itemNum] == "Patience") {
		global.player_defense += 10
		global.Monster[0].Dialogue.TextToDraw = "* Vous faites preuve& D'EXTRÊÊÊÊÊÊME patience";
		global.Monster[0].Dialogue.TextQueue[0] = "* Votre défense augmente!";
		global.Monster[0].Dialogue.TextQueue[1] = "* +10 DEF";
		//Healed = false
	}
	if (global.Item[itemNum] == "Passion") {
		global.player_hp += 100
		global.Monster[0].Dialogue.TextQueue[0] = "* Votre Passion ÉMERGE!";
		global.Monster[0].Dialogue.TextQueue[1] = "* Le Jeu-vidéo vous ~YINSPIRE!& ~DVous décidez de faire&un Jeu pour NAD";
		global.Monster[0].Dialogue.TextQueue[2] = "* NAD semble apprécier";
	}
	if (PrevArmor != "")
		global.Item[itemNum] = PrevArmor
	if (PrevWeapon != "")
		global.Item[itemNum] = PrevWeapon;
	if (StartingHP < global.player_hp) {
		audio_play_sound(sHeal, 1, false)
		if !ItemKeep {
			global.Item[itemNum] = "";
			Healed = true
		}
		if (global.player_hp >= global.player_maxhp) {
			global.Monster[0].Dialogue.TextToDraw += "*Vos HP se sont remplis."
			global.player_hp = global.player_maxhp
		}
		else {
			global.Monster[0].Dialogue.TextToDraw += "+" + string(global.player_hp - StartingHP) + " HP!";
		}
	}
	else {
		audio_play_sound(sItem, 1, false)
		if !ItemKeep {
			global.Item[itemNum] = "";
			Healed = true
		}
	}
	for (var i = 0; i <	array_length(global.Item) - 1; i++) {
		if (global.Item[i] == "") {
			global.Item[i] = global.Item[i+1];
			global.Item[i + 1] = "";
		}
	}	
	if Healed
		array_resize(global.Item, array_length(global.Item) -1)
}