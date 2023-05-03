uniform sampler2D texDiffuseMap;
uniform samplerCube texEnvMap;
uniform vec4 glowColor;
varying vec4 vvColor;
varying vec2 vvTexCoord;
varying vec3 vvTexCoordCube;
varying float vFogFactor;

void main (void)
{
    vec4 vDiffuse = texture2D(texDiffuseMap, vvTexCoord).rgba * vvColor;
#ifdef CSO_ENV
    vec3 cubeColor = textureCube(texEnvMap, vvTexCoordCube).rgb;
    vDiffuse.xyz = (vDiffuse.xyz + glowColor.www) * cubeColor;
#elif defined(CSO_GLOW)
    vec3 cubeColor = textureCube(texEnvMap, vvTexCoordCube).rgb;
    vDiffuse.xyz = vDiffuse.xyz + (cubeColor * glowColor.xyz);        
#endif

#ifndef CSO_USE_MRT
#if defined(CSO_EXP2_FOG) || defined(CSO_LINEAR_FOG)
    vDiffuse.xyz = mix(gl_Fog.color.xyz, vDiffuse.xyz, vFogFactor);
#endif
    gl_FragColor = vDiffuse;
#else   //CSO_USE_MRT
    vec3 normal = gl_TexCoord[0].xyz;
    gl_FragData[0] = vDiffuse;
    gl_FragData[1] = vec4(normal, vFogFactor);
    gl_FragData[2] = gl_TexCoord[0].w;
#endif
    
}