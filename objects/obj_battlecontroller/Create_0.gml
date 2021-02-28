/// @description Initialize the variables
depth = depth_battle.ui;

sel[0] = 0; // Selection
sel[1] = 0; // Fight
sel[2] = 0; // Act
sel[3] = 0; // Item
sel[4] = 0; // Mercy

menuno = 0;
fleeable = true;
spareable = true;

for (var i = 0; i < 6; i++;) {
	actName[i] = "Smooch";
}

box_id_prev = global.boxplacement;
turn_time = 180;
ready = false;

goldReward = irandom(5);
xpReward = irandom(3);
chance = irandom(100); // For fleeing
cooldown = 0;

wroteIntroString = false;

global.currentsong = mus_battle1;
instance_create(0, 0, obj_unfader);