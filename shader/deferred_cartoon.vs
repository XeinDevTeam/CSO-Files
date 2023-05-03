attribute vec3 vaPosition;
attribute vec2 vaTexCoord;
	
void main(void)
{
   	gl_Position = vec4(vaPosition.xyz, 1);
   	
   	gl_TexCoord[0].xy = vaTexCoord;
}

