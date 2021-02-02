extends Node
class_name Map

#imports
const Die = preload("res://Scripts/Die.gd");
const District = preload("res://Scripts/District.gd");
const Suit = preload("res://Scripts/Suit.gd");

const MAX_DICE_ROLL = 7;
const DISTRICT_AMOUNT = 4;

var districts : Array;
var die : Die = Die.new(MAX_DICE_ROLL);
var suits : Array;

# Called when the node enters the scene tree for the first time.
func _ready():
	#Generate districts with their suit
	for i in range(DISTRICT_AMOUNT):
		districts.append(District.new());
		suits.append(Suit.new());
	pass # Replace with function body.

func _init():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
