function CreateTarget(weapon){
	var border_l = 320 - (oBulletBoard.current_width / 2);
	var border_u = 384 - (oBulletBoard.current_height - 3)
	
	if (weapon == "Stylet") {
		global.paix = true
		paix = instance_create_depth(border_l +45, border_u +25, 0, oTextElement)
		paix.TexToDraw = "LOL"
		global.Monster[0].alarm[0] = 1
	}
}