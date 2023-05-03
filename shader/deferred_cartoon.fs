uniform sampler2D   texMapDiffuse;
uniform sampler2D   texMapNormal;
uniform sampler2D   texMapDepth;
uniform vec4        scrParams;



const vec2 offset[8] = 
{
    vec2(-scrParams.x, scrParams.y),
    vec2(0, scrParams.y),
    vec2(scrParams.x, scrParams.y),
    vec2(-scrParams.x, 0),
    vec2(scrParams.x, 0),
    vec2(-scrParams.x, -scrParams.y),
    vec2(0, -scrParams.y),
    vec2(scrParams.x, -scrParams.y),
};

void main (void)
{
    vec4 vDiffuse = texture2D(texMapDiffuse, gl_TexCoord[0].xy).rgba;
    vec4 vNormal = texture2D(texMapNormal, gl_TexCoord[0].xy).rgba;
    float depth = texture2D(texMapDepth, gl_TexCoord[0].xy).r;

    //=====================================
    vec4 center = texture2D(texMapNormal, gl_TexCoord[0].xy).rgba;
    center.xyz = center.xyz * 2 - 1;
    vec4 normalDepth[8];
    float val[8];
    for (int i = 0; i < 8; i++)
    {
        normalDepth[i] = texture2D(texMapNormal, gl_TexCoord[0].xy + offset[i]).rgba;
        normalDepth[i].xyz = normalDepth[i].xyz * 2 - 1;
        val[i] = dot(normalDepth[i].xyz, center.xyz);
    }
    
    float x = val[2] + val[7] + val[4]*2 - val[0] - val[3]*2 - val[5];
    float y = val[5] + val[7] + val[6]*2 - val[0] - val[1]*2 - val[2];
    
    float notEdge = (x*x + y*y < 0.3) ? 1 : 0;
    //=====================================
    
    /*
    if (gl_TexCoord[0].x < 0.5 && gl_TexCoord[0].y < 0.5)
    {
        gl_FragColor = texture2D(texMapDepth, gl_TexCoord[0].xy * vec2(2,2)).r;
        gl_FragColor.a = 1;
        return;
    }
    */
    
    //depth를 더해서, 멀면 edge를 연하게 하자..
    notEdge = clamp(notEdge + depth, 0.0, 1.0);
    gl_FragColor = vDiffuse * notEdge;


#ifdef CSO_FOG
    float fogFactor = vNormal.w;
    gl_FragColor.xyz = mix(gl_Fog.color.xyz, gl_FragColor.xyz, fogFactor);
#endif
  
}
