if (_AlphaMaskMode)
{
    float2 alphaMaskUV = sd.uv * _AlphaMask_ST.xy + _AlphaMask_ST.zw;
    float alphaMask = saturate(SCSample(_AlphaMask, sampler_BaseTexture, alphaMaskUV).r * _AlphaMaskScale + _AlphaMaskValue);
    if (_AlphaMaskMode == 1) sd.albedoAlpha.a = alphaMask;
    if (_AlphaMaskMode == 2) sd.albedoAlpha.a = sd.albedoAlpha.a * alphaMask;
    if (_AlphaMaskMode == 3) sd.albedoAlpha.a = saturate(sd.albedoAlpha.a + alphaMask);
    if (_AlphaMaskMode == 4) sd.albedoAlpha.a = saturate(sd.albedoAlpha.a - alphaMask);
}
if (_AlphaMask2ndMode)
{
    float2 alphaMask2ndUV = sd.uv * _AlphaMask2nd_ST.xy + _AlphaMask2nd_ST.zw;
    float alphaMask2nd = saturate(SCSample(_AlphaMask2nd, sampler_BaseTexture, alphaMask2ndUV).r * _AlphaMask2ndScale + _AlphaMask2ndValue);
    if (_AlphaMask2ndMode == 1) sd.albedoAlpha.a = alphaMask2nd;
    if (_AlphaMask2ndMode == 2) sd.albedoAlpha.a = sd.albedoAlpha.a * alphaMask2nd;
    if (_AlphaMask2ndMode == 3) sd.albedoAlpha.a = saturate(sd.albedoAlpha.a + alphaMask2nd);
    if (_AlphaMask2ndMode == 4) sd.albedoAlpha.a = saturate(sd.albedoAlpha.a - alphaMask2nd);
}
if (_AlphaMask3rdMode)
{
    float2 alphaMask3rdUV = sd.uv * _AlphaMask3rd_ST.xy + _AlphaMask3rd_ST.zw;
    float alphaMask3rd = saturate(SCSample(_AlphaMask3rd, sampler_BaseTexture, alphaMask3rdUV).r * _AlphaMask3rdScale + _AlphaMask3rdValue);
    if (_AlphaMask3rdMode == 1) sd.albedoAlpha.a = alphaMask3rd;
    if (_AlphaMask3rdMode == 2) sd.albedoAlpha.a = sd.albedoAlpha.a * alphaMask3rd;
    if (_AlphaMask3rdMode == 3) sd.albedoAlpha.a = saturate(sd.albedoAlpha.a + alphaMask3rd);
    if (_AlphaMask3rdMode == 4) sd.albedoAlpha.a = saturate(sd.albedoAlpha.a - alphaMask3rd);
}
