#version 450 core

uniform mat4 mvpMatrix;

layout (quads, equal_spacing, ccw) in;

in ControlPoint {

  vec4    colour;
  vec2    texCoord;
  
} inControlPoints[];

out TessVertex {

  vec4    colour;
  vec2    TexCoord;
  
} outputVertex;

//////////////////////////////////////////////////////////////////
// main()
//////////////////////////////////////////////////////////////////
void main()
{

	float u = gl_TessCoord.x;
	float v = gl_TessCoord.y;

  float w0 = (1.0f - u) * (1.0f - v);
  float w1 = u * (1.0f - v);
  float w2 = u * v;
  float w3 = (1.0f - u) * v;

  outputVertex.colour = inControlPoints[0].colour * w0 + 
                        inControlPoints[1].colour * w1 +
                        inControlPoints[2].colour * w2 + 
	            inControlPoints[3].colour * w3;
  
  outputVertex.TexCoord = inControlPoints[0].texCoord * w0 +
                          inControlPoints[1].texCoord * w1 +
                          inControlPoints[2].texCoord * w2 +
                          inControlPoints[3].texCoord * w3;
  
  vec3 pos = gl_in[0].gl_Position.xyz * w0 +
             gl_in[1].gl_Position.xyz * w1 + 
             gl_in[2].gl_Position.xyz * w2 +
             gl_in[3].gl_Position.xyz * w3;
             
  gl_Position = mvpMatrix * vec4(pos, 1.0f);

}