extends Control

var savepath = "res://budget_save.save"
# Define the variable to store the text
var input_text = ""
var saved_budget = []

func _ready() -> void:
	update_label()
	
func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")

# This function will be called whenever the text in the LineEdit changes
func _on_line_edit_text_changed(new_text):
	input_text = new_text
	
func _on_save_button_pressed() -> void:
	save()
	update_label()
	
func update_label():
	load_save()
	var label = $VBoxContainer/SavedText;
	label.text = saved_budget

func save():
	var file = FileAccess.open(savepath, FileAccess.WRITE)
	file.store_var(input_text)
	
func load_save():
	if FileAccess.file_exists(savepath):
		var file = FileAccess.open(savepath, FileAccess.READ)
		saved_budget = file.get_var()
	else:
		saved_budget = []
