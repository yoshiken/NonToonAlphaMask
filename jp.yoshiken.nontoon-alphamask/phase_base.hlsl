if (_AlphaMaskMode)
{
    float2 alphaMaskUV = sd.uv * _AlphaMask_ST.xy + _AlphaMask_ST.zw;
    float alphaMask = saturate(SCSample(_AlphaMask, sampler_BaseTexture, alphaMaskUV).r * _AlphaMaskScale + _AlphaMaskValue);
    if (_AlphaMaskMode == 1) sd.albedoAlpha.a = alphaMask;
    if (_AlphaMaskMode == 2) sd.albedoAlpha.a = sd.albedoAlpha.a * alphaMask;
    if (_AlphaMaskMode == 3) sd.albedoAlpha.a = saturate(sd.albedoAlpha.a + alphaMask);
    if (_AlphaMaskMode == 4) sd.albedoAlpha.a = saturate(sd.albedoAlpha.a - alphaMask);
}
