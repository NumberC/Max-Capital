extends Node
class_name Space

var options := ["Would you like to land here?"] setget ,getOptions;

# Connect to other spaces
var top : Space setget setTop;
var bottom : Space setget setBottom;
var left : Space setget setLeft;
var right : Space setget setRight;
var topLeft : Space setget setTopLeft;
var topRight : Space setget setTopRight;
var bottomLeft : Space setget setBottomLeft;
var bottomRight : Space setget setBottomRight;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _init():
	pass

#TODO: how to implement without cyclic dependency
func onLand():
	pass

func getOptions() -> Array:
	#Prompt to stop
	return options;

func optionHandler(option : String):
	pass

# Directions
func setTop(space : Space):
	top = space;
	space.bottom = self;

func setBottom(space : Space):
	bottom = space;
	space.top = self;

func setLeft(space : Space):
	left = space;
	space.right = self;

func setRight(space : Space):
	right = space;
	space.left = space;
	
func setTopLeft(space : Space):
	topLeft = space;
	space.bottomRight = self;

func setTopRight(space : Space):
	topRight = space;
	space.bottomLeft = self;

func setBottomLeft(space : Space):
	bottomLeft = space;
	space.topRight = self;

func setBottomRight(space : Space):
	bottomRight = space;
	space.topLeft = self;

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
