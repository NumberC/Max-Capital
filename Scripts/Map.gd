extends Node
class_name Map

const MAX_DICE_ROLL := 7;

var districts : Array;
var bank : Bank = Bank.new();

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _init():
	pass

#func createDistricts():
#	pass

func getDistricts() -> Array:
	return districts;

func getMaxDiceRoll() -> int:
	return MAX_DICE_ROLL;

func getBank() -> Bank:
	return bank;


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
