extends Node

var on_off = false

var nehezsegek = {
	"Egyszerű": {"szín": Color.GREEN, "hely": 0},
	"Normál": {"szín": Color.ORANGE, "hely": 1},
	"Nehéz": {"szín": Color.RED, "hely": 2},
	"Nehezebb": {"szín": Color.DARK_RED, "hely": 3},
	"Szuper Nehéz": {"szín": Color.DARK_BLUE, "hely": 4},
	"Rémálom": {"szín": Color.DARK_SLATE_BLUE, "hely": 5},
	"Lehetettlen": {"szín": Color.BLACK, "hely": 6},
}

func szamol(dict):
	var maxitem = 0
	for item in dict:
		maxitem += 1
	maxitem -= 1
	return maxitem
	
func random(dict):
	var rand_num = randi_range(0, szamol(dict))
	print(rand_num)
	for nehezseg in dict:
		if dict[nehezseg]["hely"] == rand_num:
			$Label.text = nehezseg
			$Label.modulate = dict[nehezseg]["szín"]

func _on_button_button_down():
	on_off = true

func _on_button_button_up():
	on_off = false

func _on_timer_timeout():
	if on_off == true:
		random(nehezsegek)
