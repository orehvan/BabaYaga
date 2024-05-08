extends Resource

enum Emotion {
	Normal,
	Happy,
	Angry,
	None,
}

@export var name_character: String = "Name"
@export var avatar_normal: Texture = null
@export var avatar_happy: Texture = null
@export var avatar_angry: Texture = null
@export var avatar_none: Texture = null

@export var emotion: Emotion = Emotion.Normal

func get_avatar() -> Texture :
	match emotion :
		Emotion.Normal :
			return avatar_normal
		Emotion.Happy :
			return avatar_happy
		Emotion.Angry :
			return avatar_angry
	
	return avatar_none

