#version 450 core

layout(binding = 0) uniform sampler2D ColTexture;
layout(binding = 1) uniform sampler2D ColTexture2;

in float Intensity;
in vec2 TexCoord;

out vec4 FragColor; // Color that will be used for the fragment
out vec4 FragColor2;

//////////////////////////////////////////////////////////////////
// main()
//////////////////////////////////////////////////////////////////
void main()
{
    vec4 colour = texture(ColTexture, TexCoord.xy); 
    vec4 colour2 = texture(ColTexture2, TexCoord.xy);

    FragColor = vec4(vec3(colour.xyz * Intensity), 0.0);
    FragColor2 = vec4(vec3(colour2.xyz * Intensity), 0.0);
}