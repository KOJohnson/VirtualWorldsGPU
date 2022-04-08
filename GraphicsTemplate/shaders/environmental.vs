#version 450 core

layout (location = 0) in vec3               vertexPos_VS;	  	// Position in attribute location 0
layout (location = 1) in vec2               texCoord_VS;
layout (location = 2) in vec3               vertexNormal_VS;

layout (location = 3) uniform mat4          modelMatrix;
layout (location = 4) uniform mat4          gVP;

layout (location = 5) uniform vec3          gCP;
layout (location = 6) uniform vec3          lightPosition;

uniform vec3 m_pos;
uniform mat4 projectionMatrix;
uniform mat4 viewMatrix;

out float Intensity;
out vec2 TexCoord;

out vec4 vertexColour;
out vec3 reflectedVector;

out vec3 Normal;
out vec3 Position;
out vec3 mpos;


//////////////////////////////////////////////////////////////////
// main()
//////////////////////////////////////////////////////////////////
void main()
{    
	Normal = mat3(transpose(inverse(modelMatrix))) * vertexNormal_VS;
	Position = vec3(modelMatrix * vec4(vertexPos_VS, 1.0));
	gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(vertexPos_VS, 1.0);

}