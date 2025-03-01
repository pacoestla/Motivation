
	global.BorderHeight = 120;
	global.BorderWidth = 180;
	oSoul.x = 320;
	oSoul.y = 384 - (global.BorderHeight / 2);
	oSoul.visible = true;
	instance_destroy(oTargetField);
	instance_destroy(oTargetBar);
	instance_create_depth(x,y,0,oBulletGenerator)