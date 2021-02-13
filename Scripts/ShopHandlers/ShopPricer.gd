extends Node
class_name ShopPricer

var playerShopCount := {};

func calc():
	pass

func setShopPrice(district : District):
	for i in district.getDistrict().getSpaces():
		if i.typeof(Shop):
			var shop : Shop = i;
			shop.getPrice()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
