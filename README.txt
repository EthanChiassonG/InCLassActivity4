PRACTICAL EXAM SHADERS ARE IN FOLDER TITLED PRACTICAL EXAM AND IS 
SHOWN IN SCENE TITLED PRACTICAL EXAM


This project will act as my submission for the Practical exam
segment of the intro to computer graphics course. 





Pacman Shader:

This shader is a tiling hologram shader remade into a shadergraph
it takes a 2 textures, one as a base and one as a overlay. The Overlay
is multiplied by a transparency value and the texture is multiplied by a 
tiling and offset value which is linked to a time scale. From there its 
multiplied by a color adn then added ontop of the base texture before both
are multiplied further by the base color and multiplied by a separate transparency value


Warioland Shader

This uses a wall+wall punch layout to emulate a Gameboy screen and boarder 
and has a separate box with the texture behind it for the screen. this screen
is supposed to have a tiled offset texture happening on it to look like a pixle 
jumble thats actually extruding the surface of the texture but I accidentally exported
the UV tiling incorrectly on my object and in the end it just kind of looks like a flag.
moving back and forth. it has lambert+ambiant+specular


Streetfighter:

Streetfighters shader is made up of 2 materials same as the first but this one has 
the overlay put through a sphericalize filter to add a bit of depth then ran through
a Boolean value to see if the texture should be avalible to represent the VS text. it has
shadows and 