confirm_key = keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(vk_enter);
skip_key = keyboard_check_pressed(ord("X")) or keyboard_check_pressed(vk_shift);

textbox_x = camera_get_view_x(view_camera[0])+10;
textbox_y = camera_get_view_y(view_camera[0]) + 170;

//setup
if(setup == false) {
	setup = true;

	oPlayer.can_move = false
	
	draw_set_font(fText);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left); 
	
	//loop through the pages
	page_number = array_length(text);
	for (var p = 0; p < page_number; p++){
		
		
		//trouve combien de caractère il y a sur chaque page et store le nombre dans lengt_array
		text_length[p] = string_length(text[p])
		
		//position x quand y'a un sprite
		text_x_offset[p] = 78;	
		portrait_x_offset[p] = 42;
		line_width = textbox_width - border*2 - text_x_offset[p]
		//position x quand y'a pas de sprite de personnage (centrer)
		if speaker_sprite[0] == noone{
			text_x_offset[p] = 17;
			line_width = textbox_width - border*2;
		}	
	}
}


//Écrire texte
if draw_char < text_length[page] {
	draw_char += text_speed;
	draw_char = clamp(draw_char, 0, text_length[page]);
}

//Tourne la page
if confirm_key {
	//si écriture terminé
	if draw_char = text_length[page]{
		//next page
		if page < page_number-1 {
			page++
			draw_char = 0;
		} else
		//destroy textbox
		{
			oPlayer.can_move = true;	
			instance_destroy();			
		}
	} 
} else if skip_key and draw_char != text_length[page] {
	//remplir la page
	draw_char = text_length[page];
}

//Dessiner la textbox
txtb_image += txtb_speed;
txtb_sprite_w = sprite_get_width(txtb_sprite);
txtb_sprite_h = sprite_get_height(txtb_sprite);	
draw_sprite_ext(txtb_sprite,txtb_image,textbox_x,textbox_y,textbox_width/txtb_sprite_w, textbox_height/txtb_sprite_h,0,c_white,1);
//Dessiner le perso
if speaker_sprite[0] != noone {
	sprite_index = speaker_sprite[page];
	if draw_char == text_length[page] {image_index = 0};
	var _speaker_x = textbox_x + portrait_x_offset[page];
	
	draw_sprite_ext(sprite_index,image_index, _speaker_x, textbox_y+(textbox_height/2), 50/sprite_width,50/sprite_height,0,c_white,1)
}
//dessiner le texte
var _drawtext =  string_copy(text[page],1,draw_char);
draw_text_ext(textbox_x + text_x_offset[page] + border, textbox_y + border, _drawtext, line_sep, line_width);