var border_l = 320 - (oBulletBoard.current_width / 2);
var border_r = 320 + (oBulletBoard.current_width / 2);
var border_u = 384 - oBulletBoard.current_height;
var border_d = 384

Dialogue = instance_create_depth(border_l + 30, border_u +15, 0, oTextElement);
Dialogue.TextToDraw = CheckDescription[0]
Dialogue.TextQueue[0] = CheckDescription[1]
Dialogue.TextQueue[1] = CheckDescription[2]
Dialogue.TextQueue[2]= CheckDescription[3]
Dialogue.CanAdvance = true