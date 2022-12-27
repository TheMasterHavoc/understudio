/// @description Initialize

// General settings
currDir					= DIR_DOWN;	// What's the player's current direction?
moveSpeed				= 3;		// The player's move speed
canMove					= true;		// Can the player move?
canMoveOverworldMenu	= true;		// Can the player move? (Overworld Menu)
canMoveDialogue			= true;		// Can the player move? (Dialogue)

// Advanced settings
stepsTaken				= 0;		// Encounters are executed if it reaches a certain amount
animateObject			= true;		// Should the player be animated?

// Other functions
alarm[0]				= 1;		// Set an alarm to adjust the camera