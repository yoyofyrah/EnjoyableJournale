extends Control

@onready var describe_text = get_node("describe")
@onready var user_text = describe_text.text

var entry = PackedStringArray([$describe, $process, $evaluate, $analyze, $conclude, $plan])
@onready var content =" ".join(entry)
	
func _on_save_pressed(): # saves the journal
	print("User entered:", user_text)
	var file = FileAccess.open("user://journal.dat", FileAccess.WRITE)
	file.store_string(content)
 
func _on_load_pressed(): # loads the journal
	var file = FileAccess.open("user://journal.dat", FileAccess.READ)
	file.store_string(content)
	
