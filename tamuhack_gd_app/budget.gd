extends Control

var savepath = "res://budget_save.save"
# Define the variable to store the text
var input_text = ""
var saved_budget = []

func _ready() -> void:
	load_save()
	if saved_budget.size() != 0:
		update_label()
	
func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
	


# This function will be called whenever the text in the LineEdit changes
func _on_line_edit_text_changed(new_text):
	input_text = new_text
	
func _on_save_button_pressed() -> void:
	saved_budget.insert(0, input_text)
	save()
	update_label()
	
func _on_clear_button_pressed() -> void:
	saved_budget = []
	save()
	update_label()
	
func update_label():
	load_save()
	var label = $VBoxContainer/HBoxContainer2/SavedText;
	var budget_string = ""
	for i in range(saved_budget.size()):
		budget_string = budget_string + saved_budget[i] + "\n"
	label.text = budget_string

func save():
	var file = FileAccess.open(savepath, FileAccess.WRITE)
	file.store_var(saved_budget)
	
func load_save():
	if FileAccess.file_exists(savepath):
		var file = FileAccess.open(savepath, FileAccess.READ)
		saved_budget = file.get_var()
	else:
		saved_budget = []
