extends Control

var savepath = "res://input_text.save"

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")

# Define the variable to store the text
var input_text = ""
var saved_text = ""

# This function will be called whenever the text in the LineEdit changes
func _on_line_edit_text_changed(new_text):
	input_text = new_text
	print("The text is now: ", input_text)
	
func _on_save_button_pressed() -> void:
	save()
	load_save()
	var label = $VBoxContainer/SavedTextSavedText;
	label.text = saved_text
	


func save():
	var file = FileAccess.open(savepath, FileAccess.WRITE)
	file.store_var(input_text)
	
func load_save():
	if FileAccess.file_exists(savepath):
		var file = FileAccess.open(savepath, FileAccess.READ)
		saved_text = file.get_var()
	else:
		saved_text = ""
