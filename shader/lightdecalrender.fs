uniform sampler2D   texDiffuseMap;
uniform vec4        lightPos[32];
uniform vec4        lightColor[32];


void main (void)
{
    vec3 lighting = vec3(0.0, 0.0, 0.0);
    ivec3 lightInfo;
    lightInfo.x = int(gl_TexCoord[2].x);
    lightInfo.y = int(gl_TexCoord[2].y);
    lightInfo.z = int(gl_TexCoord[2].z);
      
    for (int i = 1; i <= lightInfo.x; i++)
    {
        int lightIdx = lightInfo[i];
        vec4 light = lightPos[lightIdx];
        vec3 diff = light.xyz - gl_TexCoord[1].xyz;
        float distSQ = dot(diff, diff);
        float atten = distSQ * light.w;
        atten = clamp(atten, 0.0, 1.0);
        lighting += lightColor[lightIdx].xyz * (1 - atten);
    }
    
    if (lighting == vec3(0,0,0))
        discard;
    
    vec4 vDiffuse = texture2D(texDiffuseMap, gl_TexCoord[0].xy).rgba;      
    vDiffuse.xyz *= lighting;
    gl_FragColor = vDiffuse;
    
}
