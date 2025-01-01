extends Node2D
var NUM_BOIDS = 10
var IMAGE_SIZE = int(ceil(sqrt(NUM_BOIDS)))
var boid_data : Image
var boid_data_texture : ImageTexture

# Called when the node enters the scene tree for the first time.
func _ready():
	boid_data = Image.create(NUM_BOIDS, 1, false, Image.FORMAT_RGBAH)								
	randomize()
	for i in NUM_BOIDS:
		boid_data.set_pixel(i,0,Color(0.0,0.0,0.0,randi_range(0,3)))
		
	boid_data_texture = ImageTexture.create_from_image(boid_data)
	$AtlasParticles.amount = NUM_BOIDS
	$AtlasParticles.process_material.set_shader_parameter("IDs", boid_data_texture)
