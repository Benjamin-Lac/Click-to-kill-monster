extends Node2D

@onready var action = $AnimatedSprite2D
@onready var healthbar = $HealthBar  # Reference to the health bar

var max_health =0
var current_health =0
var damage=10
signal enemy_died 
func _ready() -> void:
	# Initialize the health bar with max health
	healthbar.init_health(max_health)
	
	print("New health main:",max_health)

func _process(delta):
	if Input.is_action_just_pressed("click"):
		print("click")
		action.play("hurt")
		# Move right.
		decrease_health(damage) 
		
func damage_mod(new: int):
	damage=new
	
func set_max_health(new_max_health: int)->void:
	max_health = new_max_health
	current_health=max_health
	
	
	
		
# Function to decrease health
func decrease_health(amount: int) -> void:
	current_health -= amount  # Decrease current health
	healthbar.health=current_health
	print("Current health:",current_health)
	if current_health <=0:
		action.play("death")
		print("death animation playing")
		
		die()
		
		
		
	
func die() -> void:
	
	await get_tree().create_timer(1).timeout
	print("death animation ended")
	emit_signal("enemy_died")
	queue_free()
