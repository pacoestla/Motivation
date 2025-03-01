for (var i = 0; i < 4; i++) {
	draw_sprite(ButtonSprites[i],0, ButtonPositions_X[i], 430)
}

if (global.UISelectionMenu > -1) {
	if (global.BattleMenu == 0) {
		if keyboard_check_pressed(vk_left) {
			global.UISelectionMenu -= 1;
			audio_play_sound(sMoveMenu, 1, false)
		}
		if keyboard_check_pressed(vk_right) {
			global.UISelectionMenu += 1;
				audio_play_sound(sMoveMenu, 1, false)
		}
		global.UISelectionMenu = clamp(global.UISelectionMenu, 0,3)
		for (var i = 0; i < 4; i++) {
			draw_sprite(ButtonSprites[i], (global.UISelectionMenu == i and !instance_exists(oBullet)), ButtonPositions_X[i], 430)
			if !instance_exists(oBullet)
				draw_sprite(sSoul, 0, ButtonPositions_X[global.UISelectionMenu] + 16, 452)
		}
	}
	
	if (global.BattleMenu == 1 or global.BattleMenu == 2) {
		global.UISelectionMenu = clamp(global.UISelectionMenu, 0, array_length(global.Monster) -1);
		
		for (var i = 0; i < array_length(global.Monster); i++) {
			if (global.Monster[i].ShowHealthBar) {
				var percent = (global.Monster[i].MyHP) * 100
				draw_set_color(c_red);
				draw_rectangle(470, 287 + (30 *i), 570, 304 + (30 *i), false);
				draw_set_color(c_lime)
				draw_rectangle(470, 287 + (30 *i), 570, 304 + (30 *i), false);
			}
		}
	}
	if (global.BattleMenu == 2.5)
		global.UISelectionMenu = clamp(global.UISelectionMenu, 0, array_length(global.Monster[MonsterReferenceNum].Act) -1 )
	if (global.BattleMenu = 3)
		global.UISelectionMenu = clamp(global.UISelectionMenu, 0, array_length(global.Item) -1)
		
	if (global.BattleMenu == 1 or global.BattleMenu == 2 or global.BattleMenu == 4)
		draw_sprite(sSoul, 0, 63, 295 + (30 * global.UISelectionMenu));
	else if (global.BattleMenu > 0)
		draw_sprite(sSoul, 0, 63 + (250 * (global.UISelectionMenu % 2)), 295 + (30 * floor(global.UISelectionMenu / 2)))
	
	
	if keyboard_check_pressed(ord("X")) {
		global.BattleMenu = 0;
		global.UISelectionMenu = BelowUIReferenceNum;
	}
	
	if global.BattleMenu != 2 and global.BattleMenu != 3 and global.BattleMenu !=2.5{
		if keyboard_check_pressed(vk_up) {
			global.UISelectionMenu -= 1;
			audio_play_sound(sMoveMenu, 1, false)	
		}
		if keyboard_check_pressed(vk_down) {
			global.UISelectionMenu += 1
			audio_play_sound(sMoveMenu, 1, false)
		}
	}
	else {
		if keyboard_check_pressed(vk_up) {
			global.UISelectionMenu -= 2;
			audio_play_sound(sMoveMenu, 1, false)	
		}
		if keyboard_check_pressed(vk_down) {
			global.UISelectionMenu += 2
			audio_play_sound(sMoveMenu, 1, false)
		}
		if keyboard_check_pressed(vk_left) {
			global.UISelectionMenu -= 1
			audio_play_sound(sMoveMenu, 1, false)
		}
		if keyboard_check_pressed(vk_right) {
			global.UISelectionMenu += 1
			audio_play_sound(sMoveMenu, 1, false)
		}
	}
	
	if keyboard_check_pressed(ord("Z")) {
	audio_play_sound(sSelect, 1, false)
		switch global.BattleMenu {
			case 0:
			
				global.BattleMenu = (global.UISelectionMenu +1)
				if (global.BattleMenu == 3 and array_length(global.Item) == 0) {
					global.BattleMenu = 0;
					exit;
				}
				BelowUIReferenceNum = global.UISelectionMenu
				
				global.UISelectionMenu = 0;
				
				break;
			case 1:
			
				global.BattleMenu = 1.5
				//CreateTarget("Stylet")
				global.UISelectionMenu =-1;
				break	
			case 1.5:
				global.BattleMenu = -2
				global.UISelectionMenu = -1
				event_user(global.Monster[0].event_number)
				break;
			case 2:
				MonsterReferenceNum = global.UISelectionMenu
				global.MRN = MonsterReferenceNum;
				global.BattleMenu = 2.5
				global.UISelectionMenu = 0;
				break;
			case 2.5:
				//ACT Commands				
				with (global.Monster[global.MRN]) {
					event_user(global.UISelectionMenu)
				}
				global.BattleMenu = -2;
				global.UISelectionMenu =-1;
				break;
			case 3:
			
				UseItem(global.UISelectionMenu);
				global.BattleMenu = -2;
				global.UISelectionMenu = -1;
				break;
			case 4:
				var border_l = 320 -(oBulletBoard.current_width / 2)
				var border_u = 384 - oBulletBoard.current_height
				//Spare or Flee
				if (global.UISelectionMenu == 0) {
					var Spares = 0;
					for (var i = 0; i < 3; i++) {
						if instance_exists(global.Monster[0]) {
							if (global.Monster[0].CanSpare) {
								with (global.Monster[0])
									//alarm[3] = 1;
								Spares += 1;
							}
						}
					}
					if (Spares > 0) {
						audio_play_sound(sSlash, 20, false)
						var Monsters = 0
						for (var i=0;i<3;i++) {
							if instance_exists(global.Monster[0]) {
								Monsters += 1;
							}
						}
						Monsters -= Spares;
						if (Monsters == 0) {
						//	var AccumulatedEXP = (global.player_exp - CurrentEXP)
						//	var AcumulatedGOL = (global.PlayerGOL - CurrentGOL)
							
							global.BattleMenu = -9999
							global.UISelectionMenu = -1
							WinText = instance_create_depth(border_l + 30, border_u +15,0,oTextElement)
							WinText.TextToDraw = "ADMIS!!"
							WinText.CanAdvance = true
							exit
						}
					}
				}
		}
	}
}
else {
	if (WinText != noone) {
		if !instance_exists(WinText) {	
		}
	}
}