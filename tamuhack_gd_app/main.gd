extends Control


func _on_profile_button_pressed() -> void:
	get_tree().change_scene_to_file("res://profile.tscn")

func _on_budget_button_pressed() -> void:
	get_tree().change_scene_to_file("res://budget.tscn")

func _on_progress_button_pressed() -> void:
	get_tree().change_scene_to_file("res://progress.tscn")


func _on_settings_button_pressed() -> void:
	get_tree().change_scene_to_file("res://settings.tscn")
