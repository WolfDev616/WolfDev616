extends Node2D

#WALLET
var wallet_capital: float = 0.00
var inicial_capital: float = 0.00

#SCREW VARS
var score_screw_total: float = 0.00
var score_screw_produced: int = 0
var stored_screw: int = 0

#COIL VARS
var score_coil_total: float = 0.00
var score_coil_produced: int = 0
var stored_coil: int = 0

#ELECTRONIC VARS
var score_elect_total: float = 0.00
var score_elect_produced: int = 0
var stored_elect: int = 0

#SCREWS
onready var producedScrew_label = get_node("Control/ScrewsWorkTab/ScrewNode/producedLabel")
onready var totalScrew_label = get_node("Control/ScrewsWorkTab/ScrewNode/totalLabel")
onready var storedScrew_label = get_node("Control/Storage/storage/screwsLabel")

#COILS
onready var producedCoil_label = get_node("Control/CoilWorkTab/CoilNode/producedCoilLabel")
onready var totalCoil_label = get_node("Control/CoilWorkTab/CoilNode/totalCoilLabel")
onready var storedCoil_label = get_node("Control/Storage/storage/coilsLabel")
onready var coilTimer = get_node("Control/CoilWorkTab/CoilNode/coilTimer")

#ELECTRONICS
onready var producedElect_label = get_node("Control/ElectWorkTab/ElectNode/producedElectLabel")
onready var totalElect_label = get_node("Control/ElectWorkTab/ElectNode/totalElectLabel")
onready var storedElect_label = get_node("Control/Storage/storage/electLabel")
onready var electTimer = get_node("Control/ElectWorkTab/ElectNode/electTimer")

onready var wallet_score = get_node("Control/walletLabel")

#SAVE GAME

func save_main_scene(): 
	var save_dict = {
		"wallet_capital": wallet_capital,
		"inicial_capital": inicial_capital,
		"score_screw_total": score_screw_total,
		"score_screw_produced": score_screw_produced,
		"stored_screw": stored_screw,
		"score_coil_total": score_coil_total,
		"score_coil_produced": score_coil_produced,
		"stored_coil": stored_coil,
		"score_elect_total": score_elect_total,
		"score_elect_produced": score_elect_produced,
		"stored_elect": stored_elect
	}
	return save_dict

signal add_to_wallet

#SCREWS WORKTAB
func _on_makeButton_pressed():
	score_screw_produced = int(score_screw_produced + 1.0)
	var scoretext = "Produced: " + String(score_screw_produced)
	producedScrew_label.clear()
	producedScrew_label.add_text(scoretext)
	
	score_screw_total = score_screw_produced * 0.20000
	var scoretext2 = "Total: $" + String(score_screw_total)
	totalScrew_label.clear()
	totalScrew_label.add_text(scoretext2)
	
func _on_stockButton_pressed() -> void:
	stored_screw = stored_screw + score_screw_produced
	var scoretextstored1 = "Screws: " + String(stored_screw)
	storedScrew_label.clear()
	storedScrew_label.add_text(scoretextstored1)

	score_screw_produced = 0
	var scoretext = "Produced: " + String(score_screw_produced)
	producedScrew_label.clear()
	producedScrew_label.add_text(scoretext)

	score_screw_total = 0.00
	var scoretext2 = "Total: $" + String(score_screw_total)
	totalScrew_label.clear()
	totalScrew_label.add_text(scoretext2) 

func _on_shipScrewButton_pressed() -> void:
	emit_signal("add_to_wallet")
	score_screw_produced = 0
	score_screw_total = 0.00 
	var scoretext2 = "Total: $" + String(score_screw_total)
	var scoretext = "Produced: " + String(score_screw_produced)
	totalScrew_label.clear()
	totalScrew_label.add_text(scoretext2)
	producedScrew_label.clear()
	producedScrew_label.add_text(scoretext)

#COIL WORKTAB
func _on_makeCoilButton_pressed():
#	var coil_timer = $Control/CoilWorkTab/CoilNode/coilTimer
#	coil_timer.set_wait_time(2)
#	coil_timer.start()
	$Control/CoilWorkTab/CoilNode/makeCoilButton.disabled = true
	yield(get_tree().create_timer(1.0),"timeout")
	score_coil_produced = int(score_coil_produced + 1.000)
	var scoretextc = "Produced: " + String(score_coil_produced)
	producedCoil_label.clear()
	producedCoil_label.add_text(scoretextc)
	$Control/CoilWorkTab/CoilNode/makeCoilButton.disabled = false


	score_coil_total = score_coil_produced * 2.000
	var scoretextc2 = "Total: $" + String(score_coil_total)
	totalCoil_label.clear()
	totalCoil_label.add_text(scoretextc2)

func _on_stockCoilButton_pressed() -> void:
	stored_coil = stored_coil + score_coil_produced
	var scoretextstored2 = "Coils: " + String(stored_coil)
	storedCoil_label.clear()
	storedCoil_label.add_text(scoretextstored2)

	score_coil_produced = 0
	var scoretextc = "Produced: " + String(score_coil_produced)
	producedCoil_label.clear()
	producedCoil_label.add_text(scoretextc)

	score_coil_total = 0.00
	var scoretextc2 = "Total: $" + String(score_coil_total)
	totalCoil_label.clear()
	totalCoil_label.add_text(scoretextc2) 

func _on_shipCoilButton_pressed() -> void:
	emit_signal("add_to_wallet")
	score_coil_produced = 0
	score_coil_total = 0.00 
	var scoretextc2 = "Total: $" + String(score_coil_total)
	var scoretextc = "Produced: " + String(score_coil_produced)
	totalCoil_label.clear()
	totalCoil_label.add_text(scoretextc2)
	producedCoil_label.clear()
	producedCoil_label.add_text(scoretextc)


#ELECTRONIC WORKTAB
func _on_makeElectButton_pressed():
#	var coil_timer = $Control/CoilWorkTab/CoilNode/coilTimer
#	coil_timer.set_wait_time(2)
#	coil_timer.start()
	$Control/ElectWorkTab/ElectNode/makeElectButton.disabled = true
	yield(get_tree().create_timer(5.0),"timeout")
	score_elect_produced = int(score_elect_produced + 1.000)
	var scoretexte = "Produced: " + String(score_elect_produced)
	producedElect_label.clear()
	producedElect_label.add_text(scoretexte)
	$Control/ElectWorkTab/ElectNode/makeElectButton.disabled = false


	score_elect_total = score_elect_produced * 8.000
	var scoretexte2 = "Total: $" + String(score_elect_total)
	totalElect_label.clear()
	totalElect_label.add_text(scoretexte2)

func _on_stockElectButton_pressed() -> void:
	stored_elect = stored_elect + score_elect_produced
	var scoretextstored3 = "Electronics: " + String(stored_elect)
	storedElect_label.clear()
	storedElect_label.add_text(scoretextstored3)

	score_elect_produced = 0
	var scoretexte = "Produced: " + String(score_elect_produced)
	producedElect_label.clear()
	producedElect_label.add_text(scoretexte)

	score_elect_total = 0.00
	var scoretexte2 = "Total: $" + String(score_elect_total)
	totalElect_label.clear()
	totalElect_label.add_text(scoretexte2) 

func _on_shipElectButton_pressed() -> void:
	emit_signal("add_to_wallet")
	score_elect_produced = 0
	score_elect_total = 0.00 
	var scoretexte2 = "Total: $" + String(score_elect_total)
	var scoretexte = "Produced: " + String(score_elect_produced)
	totalElect_label.clear()
	totalElect_label.add_text(scoretexte2)
	producedElect_label.clear()
	producedElect_label.add_text(scoretexte)


#WALLET
func _on_GameScene_add_to_wallet() -> void:
	wallet_capital = float(wallet_capital + score_screw_total)
	wallet_capital = float(wallet_capital + score_coil_total)
	wallet_capital = float(wallet_capital + score_elect_total)
	var walletText = "Your cash: $" + String(wallet_capital)
	wallet_score.clear()
	wallet_score.add_text(walletText)

#UPGRADE BUTTON
func _on_upgradeButton_toggled(button_pressed: bool) -> void:
	if(button_pressed):
		get_node("Control/Upgrades").show()
	else:
		get_node("Control/Upgrades").hide()

#STORAGE
func _on_shipButton_pressed() -> void:
	emit_signal("add_to_wallet")
	
	wallet_capital = float(wallet_capital + ((stored_screw * 0.20) + (stored_coil * 2) + (stored_elect * 8)))
	var walletText = "Your cash: $" + String(wallet_capital)
	wallet_score.clear()
	wallet_score.add_text(walletText)

	stored_screw = 0
	var scoretextstored1 = "Screws: " + String(stored_screw)
	storedScrew_label.clear()
	storedScrew_label.add_text(scoretextstored1)

	stored_coil = 0 
	var scoretextstored2 = "Coils: " + String(stored_coil)
	storedCoil_label.clear()
	storedCoil_label.add_text(scoretextstored2)

	stored_elect = 0
	var scoretextstored3 = "Electronics: " + String(stored_elect)
	storedElect_label.clear()
	storedElect_label.add_text(scoretextstored3)

#STORAGE BUTTON
func _on_storageButton_toggled(button_pressed: bool) -> void:
	if(button_pressed):
		get_node("Control/Storage").show()
	else:
		get_node("Control/Storage").hide()

#RECRUIT
func _on_recruitButton_toggled(button_pressed: bool) -> void:
	if(button_pressed):
		get_node("Control/Recruit").show()
	else:
		get_node("Control/Recruit").hide()

#BACK BUTTON
func _on_back_pressed() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Cenas/StartScene.tscn")

func _on_save_pressed() -> void:
	var saving = load("res://Scripts/SaveLoad.gd").new()
	saving.save_game()
