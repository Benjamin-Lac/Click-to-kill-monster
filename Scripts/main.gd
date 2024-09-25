extends Node

# Variables for tracking enemy health
var base_health: int = 100
var health_increment: int = 50
#var enemy_scene: PackedScene = preload("res://Scenes/Enemy.tscn")
# Path to the enemy scene

# Current enemy count
var enemy_count: int = 0
var i=0;

func calculate_health()->int:
	return base_health*(enemy_count+1)
func _ready() -> void:
		spawn_enemy()
		
	
# Function called when the enemy dies

# Function to spawn a new enemy
func spawn_enemy() -> void:
	var enemy_scene: PackedScene = preload("res://Scenes/Enemy.tscn")
	var new_enemy = enemy_scene.instantiate()
	var healthMod=calculate_health()
	
	new_enemy.set_max_health(healthMod)
	
	# Add it to the scene
	add_child(new_enemy)
	
	# Increment the enemy count
	enemy_count += 1
	print("enemy count:",enemy_count)

func enemy_died() -> void:
	
	pass
