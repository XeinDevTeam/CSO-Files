float v_lambert1 = 1.4953241322;
float dMul = 1.0 / v_lambert1;
float dAdd = (v_lambert1 - 1) * dMul;
		
attribute vec4 vaPosition;
attribute vec3 vaNormal;
attribute vec2 vaTexCoord;


uniform vec4 texOffset;
uniform vec4 colorMix;
uniform vec4 lightInfo;
uniform vec4 dLightDir;
uniform vec4 eLightPos;
uniform vec4 eLightColor;
uniform vec4 worldEye;
uniform vec4 boneMat[MAX_BONE_REG];
uniform vec4 param;      //x:near

varying vec4 vvColor;
varying vec2 vvTexCoord;
varying vec3 vvTexCoordCube;
varying float vFogFactor;
	
void main(void)
{
    float alpha = lightInfo.x;
	float ambient = lightInfo.y;
	float shadeLight = lightInfo.z;
	float aniTime = lightInfo.w;
	int boneIdx = int(vaPosition.w);
	float eLightRadius2 = eLightPos.w;
	float envBrightMul = colorMix.w;
	
	vec4 pos = vec4(vaPosition.xyz, 1);
	vec4 boneCol0 = boneMat[boneIdx * 3];
	vec4 boneCol1 = boneMat[boneIdx * 3 + 1];
	vec4 boneCol2 = boneMat[boneIdx * 3 + 2];
	vec4 trnPos;
	trnPos.x = dot(pos, boneCol0);
	trnPos.y = dot(pos, boneCol1);
	trnPos.z = dot(pos, boneCol2);
	trnPos.w = 1;
	gl_Position = gl_ModelViewProjectionMatrix * trnPos;

#if defined(CSO_EXP2_FOG) || defined(CSO_LINEAR_FOG) || defined(CSO_USE_MRT)
    vec3 viewPos = (gl_ModelViewMatrix * trnPos).xyz;
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
			
	vec3 normal;
	normal.x = dot(vaNormal, boneCol0.xyz);
	normal.y = dot(vaNormal, boneCol1.xyz);
	normal.z = dot(vaNormal, boneCol2.xyz);
	
	vvColor.w = alpha;		

#ifdef CSO_FULL_DLIGHT
	vvColor.xyz = vec3(1, 1, 1);
#else
    vvColor.xyz = vec3(ambient, ambient, ambient);
    float dotNdL = dot(normal, dLightDir.xyz);
    dotNdL = max(0.0, dotNdL * dMul + dAdd);
    vvColor.xyz -= shadeLight * dotNdL;
#endif

	vvColor.xyz *= colorMix.xyz;
				
#ifdef CSO_ELIGHT
    vec3 lightVec = eLightPos.xyz - trnPos.xyz;
    float attenuation = eLightRadius2 / dot(lightVec, lightVec);
    float dotNeL = max(0.0, dot(normalize(lightVec), normal));
    vvColor.xyz += (dotNeL * attenuation) * eLightColor.xyz;
#endif
   
#ifdef CSO_FINAL_WHITE
    vvColor.xyz = colorMix.xyz;
#endif
    
	vvTexCoord = (vaTexCoord + texOffset.xy) * texOffset.zw;
	
#ifdef CSO_ENV
    vvColor.xyz *= envBrightMul;
	vvTexCoordCube = reflect(trnPos.xyz - worldEye.xyz, normal);
#elif defined(CSO_GLOW)
    vvTexCoordCube = (normal * 0.2) + worldEye.xyz;
#endif

#ifdef CSO_USE_MRT
    gl_TexCoord[0].xyz = (gl_NormalMatrix * normal) * 0.5 + 0.5;
    gl_TexCoord[0].w = viewPos.z / -param.x;
#endif
}