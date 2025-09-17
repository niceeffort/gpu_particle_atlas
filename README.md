# GPU Particle Atlas
This is an example of how to use an atlas texture with a GPU particle system to render unique images for each particle.

![GPU Particle Atlas demo image](readme/gpu_atlas_particles_doc_image.png)

## Overview
1) Create a texture atlas with a frame for each image.

2) Create a [GPUParticles2D](https://docs.godotengine.org/en/4.4/classes/class_gpuparticles2d.html) system. 
3) Create a shader for the Process Material that assigns a unique ID to each particle. I am storing the ID in a texture that I set in the Process Material in [main.gd](main.gd). 
4) This ID will be converted to a number between 0 and 1 and stored in the CUSTOM.z component. The CUSTOM vector is passed to the CanvasItem shader as the INCOME_CUSTOM variable. The z component is used to define the frame of the atlas to use for that particle. This is explained on the [CanvasItem shader documentation](https://docs.godotengine.org/en/4.4/tutorials/shaders/shader_reference/canvas_item_shader.html) in the <b>Vertex built-ins</b> section.
5) This is done by dividing the ID by the maximum possible ID value (horizontal_frames * vertical_frames = total_frames). You can see this the <b>process_display_param()</b> in [atlas_particles_particles.gdshader](atlas_particles_particles.gdshader)
```gdscript
vec4 id = texelFetch(IDs, ivec2(int(INDEX), 0), 0);
CUSTOM.z = id.a / (4.0 * 14.0); 
``` 
6) This value will be converted to a UV coordinate in the CanvasItem shader.
7) Create a [CanvasItem shader](https://docs.godotengine.org/en/4.4/tutorials/shaders/shader_reference/canvas_item_shader.html) and set the horizontal and vertical frame counts.
<img src="readme/canvas_item.png" alt="CanvasItem" width="200" />

## Credits
![Playing card sprite sheet](playing_cards.png)

This sprite sheet is by Yewbi https://unbent.itch.io/yewbi-playing-card-set-1. I have modified the original layout to be 4 horizontal frames and 14 vertical frames. I do not use the back of the card or jokers in this demo.