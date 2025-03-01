//Parametre textbox
textbox_width = 300;
textbox_height = 60;
border = 8;
line_sep = 15;
line_width = textbox_width - border*2;
txtb_sprite = sTextbox;
txtb_image = 0;
txtb_speed = 0;
txtb_snd = sndDefaultText;
 //text
 page = 0;
 page_number = 0;
 text[0] = "text";
 
 text_length[0] = string_length(text[0]);
 draw_char = 0;
 old_draw_char = 0;
 text_speed =1;
 
 setup = false;
 
 speaker_sprite[0] = noone;
 