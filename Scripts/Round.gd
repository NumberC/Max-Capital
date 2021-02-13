extends Node
class_name Round

var map : Map;
var players : Array;
var playerControllers : Array;
var die : Die;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _init(chosenMap : Map):
	map = chosenMap;
	var maxDieRoll := map.getMaxDiceRoll();
	die = Die.new(maxDieRoll);
	
	for i in players:
		playerControllers.append(PlayerController.new(i, map.getBank()));

func gameLoop():
	for playerController in playerControllers:
		var roll = die.getDiceRoll();
		var controller : PlayerController = playerController;
		
		#controller.setCurrentSpace()
	pass

func movePlayer():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
