extends Node2D

const NUM_UNIQUE_CARDS := 52
const NUM_CARDS := 1000
const IMAGE_SIZE := int(ceil(sqrt(NUM_UNIQUE_CARDS)))

var card_data: Image
var card_data_texture: ImageTexture

# Called when the node enters the scene tree for the first time.
func _ready():

	# Create an 2D image to store the id for each card
	card_data = Image.create(NUM_CARDS, 1, false, Image.FORMAT_RGBAH)

	# Fill the alpha channel of each pixel with the card id
	for card in NUM_CARDS:
		card_data.set_pixel(card, 0, Color(0.0, 0.0, 0.0, card % NUM_UNIQUE_CARDS))

	# Create a texture from the image data and pass it to the particle shader
	card_data_texture = ImageTexture.create_from_image(card_data)
	$AtlasParticles.process_material.set_shader_parameter("IDs", card_data_texture)

	# Set the number of particles to the number of cards
	$AtlasParticles.amount = NUM_CARDS

func _process(delta):
	get_window().title = str("FPS: %d" % Performance.get_monitor(Performance.TIME_FPS))
