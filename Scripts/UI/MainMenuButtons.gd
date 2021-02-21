extends VBoxContainer

onready var playBtn = get_node("PlayBtn");
onready var settingsBtn = get_node("SettingsBtn");
onready var leaderboardBtn = get_node("LeaderboardBtn");
onready var supportBtn = get_node("SupportBtn");

func _ready():
	playBtn.connect("pressed", self, "playBtnClick");
	settingsBtn.connect("pressed", self, "settingsBtnClick");
	leaderboardBtn.connect("pressed", self, "leaderboardBtnClick");
	supportBtn.connect("pressed", self, "supportBtnClick");

func playBtnClick():
	#TODO: catch error
	get_tree().change_scene("res://Assets/Scenes/PlayType.tscn");

func settingsBtnClick():
	get_tree().change_scene("res://Assets/Scenes/Settings.tscn");

func leaderboardBtnClick():
	print("Go to leaderboard");

func supportBtnClick():
	print("Go to support");
