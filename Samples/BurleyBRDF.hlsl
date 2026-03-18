
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

/*

Lit Shader with Burley (Disney) diffuse model.

This is Frostbite version with renormalization of energy ("Moving Frostbite to Physically Based Rendering" papers).

Made with custom HLSL files related to Default Lit shader with making additional diffuse calculations.

Lighting function was changed from LightingPhysicallyBased() and LightingLambert() in URP Lighting.hlsl
 to LightingBurley() in BurleyLighting.hlsl.
 
Burley diffuse model function is located in BurleyBRDF.hlsl file. 

It is recommended to use it with Forward/Forward+ rendering paths
because deferred shading is processed not in this shader's pass, but in the StencilDeferred.hlsl Gbuffer pass. 

<b>Using with Deferred Rendering Path:<b>

1) Use BurleyLitForwardOnly (ineffective with many lights). This will force process shading in Forward pass after GBuffer pass.


----ДОБАВИТЬ ПОЗЖЕ-----
2) Replace URP's Lighting.hlsl with same file from DeferredBurley folder. That will replace LightingPhysicallyBased() definition
to same defenition as LightingBurley(). This will cause all Default Lit objects shaded with Burley diffuse model.
*/