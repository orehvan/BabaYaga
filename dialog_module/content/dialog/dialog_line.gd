@tool
extends PanelContainer

const DialogLineGd := preload("res://dialog_module/content/dialog/avatar_icon.gd")


enum Direction {
	Left,
	Right
}


@onready var _left_icon: DialogLineGd = %LeftIcon
@onready var _right_icon: DialogLineGd = %RightIcon

@onready var _left_spacer: Control = %LeftSpacer
@onready var _right_spacer: Control = %RightSpacer

@onready var _margin_text: MarginContainer = %MarginText
@onready var _text: RichTextLabel = %Text

@onready var _timer_text_showing: Timer = %TimerTextShowing




@export var texture_icon: Texture = null


@export var direction_avatar: Direction = Direction.Right :
	set(val) :
		direction_avatar = val
		_update_ui()

@export var spacer_size: float = 20.0 :
	set(val) :
		spacer_size = val 
		_update_ui()

@export var margin_text: float = 10.0 :
	set(val) :
		margin_text = val
		_update_ui()

@export var margin_icon: float = 10.0 :
	set(val) :
		margin_icon = val
		_update_ui()

@export var time_print_char: float = 0.05 :
	set(val) :
		time_print_char = val
		_update_ui()

@export var name_character: String = "Name" :
	set(val) :
		name_character = val
		_update_ui()

func _ready() -> void:
	_update_ui()
	_timer_text_showing.start()

func _update_ui() -> void :
	if not is_inside_tree() :
		return
	
	if _left_icon :
		_left_icon.visible = direction_avatar == Direction.Left
		_left_icon.margin = margin_icon
		_left_icon.texture_icon = texture_icon
		_left_icon.name_character = name_character
	
	if _right_icon :
		_right_icon.visible = direction_avatar == Direction.Right
		_right_icon.margin = margin_icon
		_right_icon.texture_icon = texture_icon
		_right_icon.name_character = name_character
	
	if _left_spacer :
		_left_spacer.custom_minimum_size.x = spacer_size if direction_avatar == Direction.Right else 0
	
	if _right_spacer :
		_right_spacer.custom_minimum_size.x = spacer_size if direction_avatar == Direction.Left else 0
	
	if _timer_text_showing :
		_timer_text_showing.wait_time = time_print_char
	
	if _margin_text :
		_margin_text.add_theme_constant_override("margin_top", margin_text)
		_margin_text.add_theme_constant_override("margin_left", margin_text)
		_margin_text.add_theme_constant_override("margin_bottom", margin_text)
		_margin_text.add_theme_constant_override("margin_right", margin_text)


func _on_timer_text_showing_timeout() -> void:
	if _text.get_total_character_count() <= _text.visible_characters :
		_timer_text_showing.stop()
		return
	
	_text.visible_characters += 1

func add_text(text: String) -> void :
	_text.add_text(text)
	if _timer_text_showing.is_stopped() :
		_timer_text_showing.start()
	
	if _text.visible_characters == -1 :
		_text.visible_characters = 0
	
	if _text.get_total_character_count() > _text.visible_characters :
		_timer_text_showing.start()
