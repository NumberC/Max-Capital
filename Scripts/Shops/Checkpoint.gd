extends Shop

const INCREASE_PER_LAND = 10;
var toll := 10;

func onPass(playerLanded : Player):
	playerLanded.spendCash(toll);
	shopOwner.addCash(toll);
	toll += INCREASE_PER_LAND;
