#version 450 core

layout (vertices = 4) out;

//////////////////////////////////////////////////////////////////
// main()
//////////////////////////////////////////////////////////////////
void main()
{
    gl_out[gl_InvocationID].gl_Position = gl_in[gl_InvocationID].gl_Position;


	gl_TessLevelOuter[0] = 3.0f;
    gl_TessLevelOuter[1] = 7.0f;
    gl_TessLevelOuter[2] = 11.0f;
    gl_TessLevelOuter[3] = 15.0f;


	gl_TessLevelInner[0] = 15.0f;
    gl_TessLevelInner[1] = 15.0f;

}