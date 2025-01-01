shader_type canvas_item;
uniform ivec2 frame_dim;
uniform int frame;

void vertex() {
	// Called for every vertex the material is visible on.
	VERTEX *= vec2( 1.0 / float(frame_dim.x), 1.0 / float(frame_dim.y));
}

void fragment() {
	// Called for every pixel the material is visible on.
	float width = 1.0 / float(frame_dim.x);
	float height = 1.0 / float(frame_dim.y);
	COLOR = texture(TEXTURE, UV * vec2(width, height) + vec2(mod(float(frame),float(frame_dim.x)) * width, float(int((float(frame) / float(frame_dim.x)))) * height));
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
