extends CanvasLayer

var kills = 0 
var coins = 0 
# Called when the node enters the scene tree for the first time.
func _ready():
	$Coins.text = String(coins)
	$enemy.text = String(kills)
	if coins == 10:
		get_tree().change_scene("res://LevelWin.tscn")
		
func _on_coin_collected():
	$xp_get.play()
	coins = coins + 1
	_ready()
	
func _on_enemy_killed():
	kills = kills + 1
	_ready()
