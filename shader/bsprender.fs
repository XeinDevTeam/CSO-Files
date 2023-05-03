uniform sampler2D   texDiffuseMap;
uniform sampler2D   texLightMap;
varying float vFogFactor;

void main (void)
{
    vec4 vDiffuse = texture2D(texDiffuseMap, gl_TexCoord[0].xy).rgba;

    if (gl_Color.a == 1)
    {
        vec4 vLightMap = texture2D(texLightMap, gl_TexCoord[0].zw).rgba;
        vDiffuse *= vLightMap;
    }
    vDiffuse *= gl_Color;
    
#ifndef CSO_USE_MRT
#if defined(CSO_EXP2_FOG) || defined(CSO_LINEAR_FOG)
    vDiffuse.xyz = mix(gl_Fog.color.xyz, vDiffuse.xyz, vFogFactor);
#endif
    gl_FragColor = vDiffuse;
#else   //CSO_USE_MRT
    vec3 vNormal = gl_TexCoord[1].xyz;
    gl_FragData[0] = vDiffuse;
    gl_FragData[1] = vec4(vNormal, vFogFactor);
    gl_FragData[2] = gl_TexCoord[1].w;
#endif  //CSO_USE_MRT
}