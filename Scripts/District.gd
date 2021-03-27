extends Node
class_name District

var color : Color;
var spaces : Array setget ,getSpaces;
var playerShopCount := {};
 # var suit : Suit;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _init():
	pass

func getSpaces() -> Array:
	return spaces;
	
func addSpaces(space : Space):
	spaces.append(space);

#Handles the expansion of shops
func upgradeShops():
	updatePlayerShopCount();
	updateShopCapitalAndPrice();

func updatePlayerShopCount():
	for space in spaces:
		if space.typeof(Shop):
			var shop : Shop = space;
			var shopOwner := shop.getOwner();
			
			if playerShopCount.has(shopOwner):
				playerShopCount[shopOwner].append(shop);
			else:
				playerShopCount[shopOwner] = [shop];

func updateShopCapitalAndPrice():
	for player in playerShopCount.keys():
		var shopList : Array = playerShopCount[player];
		var shopCount = shopList.size();
		var increaseFactor : int = pow(2, shopCount);
		for a in shopList:
			var playerShop : Shop = a;
			playerShop.setMaxCapital(playerShop.getMaxCapital() * increaseFactor);
			playerShop.setPrice(playerShop.getPrice() * increaseFactor);
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
