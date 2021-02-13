extends Node
class_name ShopTransaction

const BUY_FACTOR = 5;
var previousOwner : Player;
var newOwner : Player;
var shop : Shop;

func _init(previousOwner : Player, shop : Shop, newOwner : Player):
	self.previousOwner = previousOwner;
	self.shop = shop;
	self.newOwner = newOwner;
	buyOrSellShop();

func buyOrSellShop():
	var price = newOwner.getValue() * BUY_FACTOR;
	var newOwnerCash = newOwner.getCash();
	var previousOwnerCash = previousOwner.getCash();
	if newOwnerCash >= price:
		previousOwner.removeShop(shop);
		previousOwner.setCash(previousOwnerCash + price);
		#TODO: set networth
		newOwner.addShop(shop);
		newOwner.setCash(newOwnerCash - price);

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
