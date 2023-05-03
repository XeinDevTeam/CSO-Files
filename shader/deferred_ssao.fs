uniform sampler2D   texMapDiffuse;
uniform sampler2D   texMapNormal;
uniform sampler2D   texMapDepth;
uniform vec4        scrParams;  //  1/scrW, 1/scrH, near, far
uniform vec4        ssaoParams; //  distRatio, kernalWidth, wSamples, 0
uniform vec4        ssaoParams2; // rayStepX, rayStepY, 0, 0

vec3 CalcModelViewPos(vec2 uv, vec3 rayVec, vec2 offset)
{
    vec2 uvStep = scrParams.xy;
    vec2 rayStep = ssaoParams2.xy;

    uv += uvStep * offset;
    rayVec.xy += rayStep * offset;
    float depth = texture2D(texMapDepth, uv).r;
           
    return rayVec * depth;
}

float SSAO_CalcSample(vec3 checkPos, vec3 centerPos, vec3 normal)
{  
    float distRatio = ssaoParams.x;
    vec3 diff = checkPos - centerPos;
    vec3 dir = normalize(diff);
    float dist = length(diff) * distRatio;
    
    return max(0, dot(normal, dir)) / (1.0 + dist);
} 

float SSAO(vec2 curUV, vec3 curRay, vec3 curNormal, float curDepth)
{
    vec3 curPos = curRay * curDepth;
    
    float ao = 0;
    float kernalWidth = ssaoParams.y;
    float w_samples = ssaoParams.z;
    float near = scrParams.z;
    float far = scrParams.w;
    
    
    
    //near에서의 너비 = (너비(고정) * near) / 거리
    float uvWidth = kernalWidth * near / (far * curDepth);
    float halfWidth = uvWidth / 2;
    float step;
    if (uvWidth < w_samples)
    {
        step = 1;
    }
    else
    {
        step = uvWidth / w_samples;
    }

    for (float y = -halfWidth; y < halfWidth; y += step)
    {
        for (float x = -halfWidth; x < halfWidth; x += step)
        {
            vec2 offset = vec2(x, y);
            vec3 neighborPos = CalcModelViewPos(curUV, curRay, offset); 
            float sample_ao = SSAO_CalcSample(neighborPos, curPos, curNormal);
            ao += sample_ao;
        }
    }
        
    ao /= w_samples * w_samples;
    
    return ao;
}

void main (void)
{
    vec4 vDiffuse = texture2D(texMapDiffuse, gl_TexCoord[0].xy).rgba;
    vec4 vNormal = texture2D(texMapNormal, gl_TexCoord[0].xy).rgba;
    float depth = texture2D(texMapDepth, gl_TexCoord[0].xy).r;
    vec3 rayVec = gl_TexCoord[1].xyz;
        
    float ssao = SSAO(gl_TexCoord[0].xy, rayVec, vNormal.xyz, depth);
      
    gl_FragColor.xyz = 1 - ssao;
    gl_FragColor.a = 1;
    gl_FragColor *= vDiffuse;

#ifdef CSO_FOG
    float fogFactor = vNormal.w;
    gl_FragColor.xyz = mix(gl_Fog.color.xyz, gl_FragColor.xyz, fogFactor);
#endif
  
  
  
}
