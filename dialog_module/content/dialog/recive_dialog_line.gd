@tool
extends MarginContainer

signal pressed(id: int, type: int, text: String)

enum DialogType {
	Exit,
	Dialog,
	Fight,
	Look,
}

const TEXTURE_MAP := {
	DialogType.Exit : preload("res://dialog_module/resource/kenney_assets/cursors/Basic/Default/door_exit.png"),
	DialogType.Dialog : preload("res://dialog_module/resource/kenney_assets/cursors/Basic/Default/message_dots_square.png"),
	DialogType.Fight : preload("res://dialog_module/resource/kenney_assets/cursors/Basic/Default/tool_sword_a.png"),
	DialogType.Look : preload("res://dialog_module/resource/kenney_assets/cursors/Basic/Default/look_b.png"),
}

@onready var _text: RichTextLabel = %Text
@onready var _icon_type_dialog: TextureRect = %IconTypeDialog
@onready var _icon_selector: TextureRect = %Selected

@onready var _animtion_player: AnimationPlayer = $AnimationPlayer

@export var id: int = 0
@export var text: String = "" :
	set(val) :
		_text.text = val
		_update_ui()
	get:
		return _text.text 

@export var type_dialog: DialogType = DialogType.Dialog :
	set(val) :
		type_dialog = val
		_update_ui()

@export var oneshot: bool = true


var _pressed := false


func _ready() -> void:
	_update_ui()
	
	if not Engine.is_editor_hint() :
		if _animtion_player :
			_animtion_player.play("show")
		if _icon_selector :
			_icon_selector.visible = false

func _update_ui() -> void :
	if _text :
		_text.text = text
	
	if _icon_type_dialog :
		_icon_type_dialog.texture = TEXTURE_MAP[type_dialog]
	

func _on_button_pressed() -> void:
	if oneshot : 
		if _pressed :
			return
		_pressed = true
	
	pressed.emit(id, type_dialog, text)
	if oneshot :
		queue_free()


func _on_button_mouse_entered() -> void:
	_icon_selector.visible = true


func _on_button_mouse_exited() -> void:
	_icon_selector.visible = false
