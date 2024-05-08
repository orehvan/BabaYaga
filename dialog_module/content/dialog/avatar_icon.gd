@tool
extends PanelContainer

@onready var _margin_container: MarginContainer = $MarginContainer
@onready var _texture_rect: TextureRect = $MarginContainer/TextureRect
@onready var _label: Label = $MarginContainer/VBoxContainer/Label

@export var margin: float = 10.0 :
	set(val) :
		margin = val
		_update_ui()

@export var texture_icon: Texture = null :
	set(val) :
		texture_icon = val
		_update_ui()

@export var name_character: String = "" :
	set(val) :
		name_character = val
		_update_ui()

func _update_ui() -> void :
	if _margin_container :
		_margin_container.add_theme_constant_override("margin_top", margin)
		_margin_container.add_theme_constant_override("margin_left", margin)
		_margin_container.add_theme_constant_override("margin_bottom", margin)
		_margin_container.add_theme_constant_override("margin_right", margin)
	
	if _texture_rect :
		_texture_rect.texture = texture_icon
	
	if _label :
		_label.text = name_character

