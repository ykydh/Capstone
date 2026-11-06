extends CharacterBody2D

@export var move_speed: float = 100.0
@export var attack_range: float = 40.0
@export var attack_damage: int = 10

var player: Node2D = null
var spawn_position: Vector2


func _ready() -> void:
	spawn_position = global_position

# Check whether player exists
func can_see_player() -> bool:
	return is_instance_valid(player)


# Check attack distance
func is_player_in_attack_range() -> bool:
	if not is_instance_valid(player):
		return false

	return global_position.distance_to(
		player.global_position
	) <= attack_range


# Move toward player
func move_toward_player() -> void:
	if not is_instance_valid(player):
		velocity = Vector2.ZERO
		move_and_slide()
		return

	var direction: Vector2 = global_position.direction_to(
		player.global_position
	)

	velocity = direction * move_speed
	move_and_slide()


# Stop enemy
func stop_moving() -> void:
	velocity = Vector2.ZERO
	move_and_slide()


# Attack placeholder
func perform_attack() -> void:
	stop_moving()
	print("Enemy attacks!")

func _on_detection_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player = body
		print("Enemy detected player!")


func _on_detection_area_body_exited(body: Node2D) -> void:
	if body == player:
		player = null
		print("Player left detection range.")


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_area_2d_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
