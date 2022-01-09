extends Node

#SAVE GAME

var _game = load("res://Scripts/GameScene.gd").new()

func _ready() -> void:
	save_game()
	load_game()

func save_game(): 
	# Create new ConfigFile object.
	var config = ConfigFile.new()
	config.set_value("WALLET", "wallet", get_node("res://Scripts/GameScene.gd").wallet_capital)
#	config.set_value("Player1", "best_score", 10)
#	config.set_value("Player2", "player_name", "V3geta")
#	config.set_value("Player2", "best_score", 9001)

	# Save it to a file (overwrite if already exists).
	config.save("user://scores.cfg")
	print("Game Saved")
	pass

func load_game():
	var score_data = {}
	var config = ConfigFile.new()

	# Load data from a file.
	var error = config.load("user://scores.cfg")
	
	get_node("res://Scripts/GameScene.gd").wallet_capital = config.get_value("WALLET", "wallet")

	# If the file didn't load, ignore it.
	if error != OK:
		print("Game not loaded")
		return
	else:
		 print("Game loaded")

	# Iterate over all sections.
	for section in config.get_sections():
		# Fetch the data for each section.
		var wallet_score = config.get_value(section, "wallet")
#		var player_score = config.get_value(player, "best_score")
		score_data[wallet_score] = wallet_score

