#version 450 core

//layout(binding = 2) uniform samplerCube SkyboxTexture;
layout (binding = 2)uniform samplerCube skyBox;

out vec4 FragColor;

in vec3 Normal;
in vec3 Position;
in vec3	mpos;

uniform vec3 m_pos;
uniform sampler2D ColTexture;

in float Intensity;
in vec2 TexCoord;
in vec3 reflectedVector;

//////////////////////////////////////////////////////////////////
// main()
//////////////////////////////////////////////////////////////////
void main()
{
	vec3 I = normalize(Position - m_pos);
	vec3 R = reflect(I, normalize(Normal));
	FragColor = vec4(texture(skyBox,R).rgb, 1);
}