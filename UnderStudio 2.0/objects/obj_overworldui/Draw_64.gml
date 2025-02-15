/// @description Draw the user interface

// Initialize the variables
var cam = obj_camerahandler;

// Check if the dialogue box position checking is automated
if (dialogueIsOnTop == undefined && instance_exists(cam.currTarget))
	dialogueAlignY = cam.posCenterY > cam.currTarget.y ? 310 : 0;
else dialogueAlignY = dialogueIsOnTop ? 0 : 310;

// Function to draw the dialogue box
drawDialogueBox = function () {
	draw_box(32, 10 + dialogueAlignY, 608, 160 + dialogueAlignY);
	if (dialogueFace != undefined)
		draw_sprite_ext(dialogueFace, dialogueFaceIndex, 100, 75 + dialogueAlignY, 2, 2, 0, c_white, 1);
}

switch (state) {
	case -1:
		// Check if the previous state is 0
		if (prevState == 0) {
			prevState = -1;
			
			// Check if the state is not executed once
			if (!stateExecutedOnce) {
				drawDialogueBox();
				stateExecutedOnce = true;
			}
		}
		break;
	case 0:
		// Draw the dialogue box
		drawDialogueBox();
		
		// Check if the dialogue writer exists
		if (instance_exists(dialogueWriter)) {
			draw_rpgtext(dialogueFace != undefined ? 178 : 60, 30 + dialogueAlignY, dialogueWriter.written, dialogueFont, 1, global.mainFontWidth, global.mainFontHeight, 1, 1, c_white);
		}
		break;
}