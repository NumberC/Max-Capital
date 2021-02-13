extends Space
class_name Bank

#options = ["Would you like to buy a stock?"];

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _init():
	pass

func getOptions() -> Array:
	return options;

func optionHandler(option : String):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
