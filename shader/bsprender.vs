attribute vec3 vaPosition;
attribute vec4 vaTexCoord;
attribute vec3 vaNormal;
uniform vec4 param;      //x:near

varying float vFogFactor;
	
void main(void)
{
   	gl_Position = ftransform();
   	
   	gl_TexCoord[0] = vaTexCoord;
	gl_FrontColor = gl_Color;
	
#if defined(CSO_EXP2_FOG) || defined(CSO_LINEAR_FOG) || defined(CSO_USE_MRT)
vec3 viewPos = (gl_ModelViewMatrix * gl_Vertex).xyz;
#endif

#ifdef CSO_EXP2_FOG
    const float LOG2 = 1.442695;
    float distSQ = dot(viewPos, viewPos);
    vFogFactor = exp2(-gl_Fog.density * gl_Fog.density * distSQ * LOG2);
    vFogFactor = clamp(vFogFactor, 0.0, 1.0);
#elif defined(CSO_LINEAR_FOG)
    float dist = length(viewPos);
    vFogFactor = (dist - gl_Fog.start) / (gl_Fog.end - gl_Fog.start);
    vFogFactor = 1.0 - clamp(vFogFactor, 0.0, 1.0);
#endif

#ifdef CSO_USE_MRT
    gl_TexCoord[1].xyz = gl_NormalMatrix * vaNormal * 0.5 + 0.5;
    gl_TexCoord[1].w = viewPos.z / -param.x;
#endif

    
}

