extends CanvasLayer

const DialogLineGD := preload("res://dialog_module/content/dialog/dialog_line.gd")
const Direction := DialogLineGD.Direction

const DialogCharacterGD := preload("res://dialog_module/content/character/dialog_character.gd")


func clear() -> void :
	pass

func add_dialog(direction:Direction, dialog_character: DialogCharacterGD, text: String ) -> void :
	pass


func _on_panel_pressed(id: Variant, type: Variant, text: Variant) -> void:
	pass # Replace with function body.
