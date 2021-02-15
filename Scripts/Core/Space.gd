extends Node
class_name Space

# Connect to other spaces
var top : Space;
var bottom : Space;
var left : Space;
var right : Space;
var topLeft : Space;
var topRight : Space;
var bottomLeft : Space;
var bottomRight : Space;

"""
enum Directions{
	TOP,
	BOTTOM,
	LEFT,
	RIGHT,
	TOP_LEFT,
	TOP_RIGHT,
	BOTTOM_LEFT,
	BOTTOM_RIGHT
}
var relativeStoreLocations := [null, null, null, null, null, null, null, null];
"""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _init():
	pass

#TODO: how to implement without cyclic dependency
func onLand():
	print("You landed on this space!");

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
