extends Shop
class_name Tax

const TAX_PERCENT = 10;


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func takePercentFromNetworth(networth : int) -> int:
	return int( (TAX_PERCENT/100) * networth );

func onLandI(landedPlayer : Player):
	var profit := takePercentFromNetworth(landedPlayer.getNetworth());
	landedPlayer.spendCash(profit);
	shopOwner.addCash(profit);

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
