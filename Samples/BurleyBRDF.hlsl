
float3 F_BurleySchlick(float3 f0 , float f90 , float u)
{
    return f0 + (f90 - f0) * pow(1.0f - u, 5.0f);
}

half BurleyDiffuse(float NdotV, float NdotL, float LdotH, float roughness) {
    float energyBias = lerp (0 , 0.5 , roughness );
    float energyFactor = lerp (1.0 , 1.0 / 1.51 , roughness);
    float fd90 = energyBias + 2.0 * LdotH * LdotH;
    float3 f0 = float3 (1.0f , 1.0f , 1.0f);
    float lightScatter = F_BurleySchlick ( f0 , fd90 , NdotL ).r;
    float viewScatter  =  F_BurleySchlick (f0 , fd90 , NdotV ).r;
    
    return (lightScatter * viewScatter * NdotL * energyFactor);
}
