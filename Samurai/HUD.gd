extends CanvasLayer

var kills = 0 
var coins = 0 
# Called when the node enters the scene tree for the first time.
func _ready():
	$Coins.text = String(coins)
	$enemy.text = String(kills)
	
func _on_coin_collected():
	coins = coins + 1
	_ready()
	
func _on_kills_collected():
	kills = kills + 1
	_ready()
