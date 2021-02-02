extends Node
class_name Suit

var shape : Shape;
var color : Color;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _init(shape : Shape, color : Color):
	self.shape = shape;
	self.color = color;

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
