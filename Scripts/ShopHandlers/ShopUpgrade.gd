extends Node
class_name ShopUpgrade

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _init():
	pass

func upgradeShop(shop : Shop, upgradeAmount : float):
	var shopMaxCapital = shop.getMaxCapital();
	if shopMaxCapital >= upgradeAmount:
		shop.setMaxCapital(shopMaxCapital-upgradeAmount);
		shop.setValue(shop.getValue()+upgradeAmount);
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
