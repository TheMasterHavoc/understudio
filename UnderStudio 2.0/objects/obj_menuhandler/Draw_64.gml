/// @description Draw necessary things

var w = display_get_gui_width(), h = display_get_gui_height(), sx = w / 640, sy = h / 480;
var gpConnected = gamepad_is_connected(0);
switch (state) {
	case 0:
		// Draw the instructions
		draw_ftext(170 * sx, 41 * sy, " --- Instruction ---", fnt_main, c_silver, 1, 1, 1, 0, fa_left, fa_top);
		draw_rpgtext(170 * sx, 102 * sy, (gpConnected ? "`sprite:button_z`" : "[Z or ENTER]") + " - Confirm", fnt_main, 1, -1, -1, 1, 1, c_silver);
		draw_rpgtext(170 * sx, 137 * sy, (gpConnected ? "`sprite:button_x`" : "[X or SHIFT]") + " - Cancel", fnt_main, 1, -1, -1, 1, 1, c_silver);
		draw_rpgtext(170 * sx, 172 * sy, (gpConnected ? "`sprite:button_c`" : "[C or CTRL]") + " - Menu (In-game)", fnt_main, 1, -1, -1, 1, 1, c_silver);
		draw_rpgtext(170 * sx, 207 * sy, "[F4] - Fullscreen", fnt_main, 1, -1, -1, 1, 1, c_silver);
		draw_rpgtext(170 * sx, 242 * sy, "[Hold ESC] - Quit", fnt_main, 1, -1, -1, 1, 1, c_silver);
		draw_rpgtext(170 * sx, 277 * sy, "When HP is 0, you lose.", fnt_main, 1, -1, -1, 1, 1, c_silver);
		
		// Draw the selectable texts
		draw_rpgtext(170 * sx, 345 * sy, "Begin Game", fnt_main, 1, -1, -1, 1, 1, selection == 0 ? c_yellow : c_white);
		draw_rpgtext(170 * sx, 385 * sy, "Settings", fnt_main, 1, -1, -1, 1, 1, selection == 1 ? c_yellow : c_white);
		
		draw_ftext(w / 2, 476 * sy, "UNDERTALE ENGINE v1.00 BY ANIMELIQITE 2021-2022", fnt_crypt, c_gray, 1, 0.5, 0.5, 0, fa_center, fa_bottom);
		break;
	case 1:
		var height = 0, width = 0;
		for (var i = 0; i < string_length(namingLetters); i++) {	
			// Adjust the width and the height
			if (i % namingRows == 0) {
				width = 0;
				height++;
			} else width++;
			
			// Draw the letter
			draw_rpgtext(120 + (64 * width), 110 + (28 * height), "`effect:1`" + string_upper(string_char_at(namingLetters, i + 1)), fnt_main, 1, -1, -1, 1, 1, selection == i && subState != 2 ? c_yellow : c_white);
			draw_rpgtext(120 + (64 * width), 230 + (28 * height), "`effect:1`" + string_lower(string_char_at(namingLetters, i + 1)), fnt_main, 1, -1, -1, 1, 1, selection == i + string_length(namingLetters) && subState != 2 ? c_yellow : c_white);
		}
		
		// Draw the naming header
		draw_ftext(320, 60, namingHeader, fnt_main, c_white, 1, 1, 1, 0, fa_center);
		draw_ftext(320, 100, namingName, fnt_main, c_white, 1, 1, 1, 0, fa_center);
		
		// Draw the naming options
		draw_ftext(120, 400, namingOptions[0], fnt_main, selection == 0 && subState == 2 ? c_yellow : c_white);
		draw_ftext(240, 400, namingOptions[1], fnt_main, selection == 1 && subState == 2 ? c_yellow : c_white);
		draw_ftext(440, 400, namingOptions[2], fnt_main, selection == 2 && subState == 2 ? c_yellow : c_white);
		break;
	case 2:
		draw_ftext(320 + namingNameXOffset, 100 + namingNameYOffset, namingName, fnt_main, c_white, 1, 1 + namingNameScale, 1 + namingNameScale, random(2), fa_center);
		break;
}

draw_ftext(10, 10, selection);