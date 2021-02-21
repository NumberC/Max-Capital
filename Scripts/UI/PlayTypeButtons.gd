extends VBoxContainer

onready var localBtn = get_node("LocalBtn");
onready var onlineBtn = get_node("OnlineBtn");

func _ready():
	localBtn.connect("pressed", self, "localClick");
	onlineBtn.connect("pressed", self, "onlineClick");
	
func localClick():
	get_tree().change_scene("res://Assets/Scenes/Game.tscn")
	print("You're playing locally");

func onlineClick():
	print("You're playing online");
