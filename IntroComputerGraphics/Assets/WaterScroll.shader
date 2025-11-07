
Shader "Custom/URP_UVScroll"
{
Properties
{
_MainTex ("Main Texture", 2D) = "white" {}
_ScrollX ("Scroll X", Range(-5, 5)) = 1
_ScrollY ("Scroll Y", Range(-5, 5)) = 1
}
SubShader
{
Tags { "RenderPipeline" = "UniversalRenderPipeline" "RenderType" = "Opaque" }
Pass
{
HLSLPROGRAM
#pragma vertex vert
#pragma fragment frag
// Include URP core functionality
#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
struct Attributes
{
float4 positionOS : POSITION; // Object space position
float2 uv : TEXCOORD0; // Texture coordinates
};
struct Varyings
{
float4 positionHCS : SV_POSITION; // Homogeneous clip-space position
float2 uv : TEXCOORD0; // UV coordinates
};
TEXTURE2D(_MainTex);
SAMPLER(sampler_MainTex);
float _ScrollX;
float _ScrollY;
// Vertex Shader
Varyings vert(Attributes IN)
{
Varyings OUT;
OUT.positionHCS = TransformObjectToHClip(IN.positionOS.xyz); // Transform object position to clip
// Scroll UV coordinates over time
float2 scrolledUV = IN.uv + float2(_ScrollX, _ScrollY) * _Time.y;
OUT.uv = scrolledUV; // Pass the scrolled UVs to fragment shader
return OUT;
}
// Fragment Shader
half4 frag(Varyings IN) : SV_Target
{
// Sample the texture using the scrolled UV coordinates
half4 texColor = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, IN.uv);
return texColor;
}
ENDHLSL
}
}
}
