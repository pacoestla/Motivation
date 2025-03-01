if keyboard_check_pressed(vk_f4) and window_get_fullscreen() { 
		window_set_fullscreen(false) 
} else if keyboard_check_pressed(vk_f4) { 
		window_set_fullscreen(true) 
}
if display_get_width()!=window_get_width() {
    // resize window to display
	//window_set_size(display_get_width(),display_get_height())
	window_set_size(620,480)
}
else {
	window_set_fullscreen(false)
}