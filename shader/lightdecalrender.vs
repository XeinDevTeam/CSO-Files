attribute vec3 vaPosition;
attribute vec2 vaTexCoord;
attribute vec3 vaLitInfo;
	
void main(void)
{
   	gl_Position = ftransform();

	gl_TexCoord[0].xy = vaTexCoord.xy;
	gl_TexCoord[1].xyz = (gl_ModelViewMatrix * gl_Vertex).xyz;
	gl_TexCoord[2].xyz = vaLitInfo.xyz;
	
}