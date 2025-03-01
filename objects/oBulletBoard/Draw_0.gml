  var border_l = 320 - (current_width / 2);
var border_r = 320 + (current_width / 2);
var border_u = 384 - current_height;
var border_d = 384;
if (current_width == 570 and current_height == 120){
	//Setup pour écrire le menu
	if instance_exists(Dialogue){
		Dialogue.visible = false;	
		Fight.visible = false;
		Act.visible = false;
		ItemL.visible = false;
		ItemR.visible = false;
		Mercy.visible = false;
	}
	if (global.BattleMenu == -1){
		Dialogue = instance_create_depth(border_l +30, border_u + 25, 0, oTextElement)
		Dialogue.TextToDraw = ""
		Dialogue.CanAdvance = false;
		
		Fight = instance_create_depth(border_l +50,border_u + 25,0, oTextElement)
		for (var i = 0; i < array_length(global.Monster); i++) {
			Fight.TextToDraw = "* " + global.Monster[i].MyName;
		}
		Fight.TextLength = string_length(Fight.TextToDraw)
		Fight.CanAdvance = false;
		Fight.visible = false
		
		Peace = instance_create_depth(border_l +45, border_u +25, 0, oTextElement)
		Peace.visible = false;
		
		Act = instance_create_depth(border_l + 50, border_u + 25,0,oTextElement)
		for (var i = 0; i < array_length(global.Monster); i++) {
			Act.TextToDraw = "* " + global.Monster[i].MyName
		}
		Act.TextLength = string_length(Act.TextToDraw)
		Act.CanAdvance = false;
		Act.visible = false;
		
		ActML = instance_create_depth(border_l +45, border_u +25, 0, oTextElement)
		ActML.visible = false;
		ActMR = instance_create_depth(border_l +295, border_u +25, 0, oTextElement)
		ActMR.visible = false;
		
		
		ItemL = instance_create_depth(border_l + 50, border_u + 25,0,oTextElement)
		for (var i = 0; i < array_length(global.Item); i += 2) {
			ItemL.TextToDraw += "* " + global.Item[i] + "&";
		}
		ItemL.TextLength = string_length(ItemL.TextToDraw)
		ItemL.CanAdvance = false;
		ItemL.visible = false;
		
		ItemR = instance_create_depth(border_l + 300, border_u + 25,0,oTextElement)
		for (var i = 1; i < array_length(global.Item); i += 2) {
			ItemR.TextToDraw += "* " + global.Item[i] + "&";
		}
		ItemR.TextLength = string_length(ItemR.TextToDraw)
		ItemR.CanAdvance = false;
		ItemR.visible = false;
		
		Mercy = instance_create_depth(border_l + 50, border_u + 25,0,oTextElement)
		for (var i = 0; i < array_length(global.Monster); i++) {
			if global.Monster[i].CanSpare {
				Mercy.TextToDraw += "~Y";
				break;
			}
		}
		Mercy.TextToDraw += "* Admission~D&* Fuir";
		if !global.CanFlee
			Mercy.TextToDraw += "* Admission";
		Mercy.TextLength = string_length(Mercy.TextToDraw);
		Mercy.CanAdvance = false;
		Mercy.visible = false;
		
		global.BattleMenu = 0;
	}
	if (global.BattleMenu == 0)
		//oSoul.visible = false
		Dialogue.visible = false;
		ActML.visible = false
		ActMR.visible = false
		Peace.visible = false
	if (global.BattleMenu == 1)
		Fight.visible = true;
	if (global.BattleMenu == 1.5)
		Dialogue = instance_create_depth(border_l +30, border_u + 25, 0, oTextElement)
		Dialogue.visible = true
		Dialogue.TextToDraw = "CA MARCHE!!"
		Dialogue.CanAdvance = false
		if Dialogue.TextLength = string_length(Dialogue.TextToDraw)	
			instance_create_depth(x,y,0,)
		
	if (global.BattleMenu == 2)
		Act.visible = true;
		
	if (global.BattleMenu == 2.5) {
		ActML.visible = true;
		ActMR.visible = true;
		ActML.TextToDraw = "";
		for (var j = 0; j < array_length(global.Monster[0].Act); j += 2) {
			ActML.TextToDraw += "* " + global.Monster[0].Act[j] + "&";
		}
		ActML.TextLength = string_length(ActML.TextToDraw);
		ActML.CanAdvance = false;
		
		ActMR.TextToDraw = "";
		for (var j = 1; j < array_length(global.Monster[0].Act); j += 2) {
			ActMR.TextToDraw += "* " + global.Monster[0].Act[j] + "&";
		}
		ActMR.TextLength = string_length(ActMR.TextToDraw);
		ActMR.CanAdvance = false;
	}
	if (global.BattleMenu == 3){
		ItemL.visible = true;
		ItemR.visible = true;
	}
	if (global.BattleMenu == 4)
		Mercy.visible = true;
}


oSoul.x = clamp(oSoul.x, border_l + 8, border_r - 8)
oSoul.y = clamp(oSoul.y, border_u + 8, border_d - 8)
draw_set_color(c_white)
draw_rectangle(border_l - 4, border_u - 4, border_r + 4, border_d + 4, false);
draw_set_color(c_black)
draw_rectangle(border_l, border_u, border_r, border_d, false)

var hp_barwidth = (global.player_maxhp);
var hp_barwidth_fill = (global.player_hp);
draw_set_font(fFight);
draw_set_color(c_white)
draw_text(45 ,400, global.Name + "     LV " + string(global.player_lvl))
draw_text(355 + hp_barwidth, 400, string(global.player_hp) + " / " + string(global.player_maxhp))

draw_set_font(fFight);
draw_text(275, 398, "HP")

draw_set_color(c_red);
draw_rectangle(315, 400, 340 + hp_barwidth, 418, false);
draw_set_color(c_yellow);
draw_rectangle(315, 400, 340 + hp_barwidth_fill, 418, false);