//
//	SpriteStudio5 Player for Unity
//
//	Copyright(C) Web Technology Corp.
//	All rights reserved.
//
Shader "Custom/SpriteStudio6/Effect/Mix" {
	Properties	{
		_MainTex ("Base (RGB)", 2D) = "white" {}
	}

	SubShader	{
		Tags {
				"Queue"="Transparent"
				"IgnoreProjector"="True"
				"RenderType"="Transparent"
			}

		Pass	{
			Lighting Off
			Fog { Mode off }

			Cull Off
			ZTest LEqual
			ZWRITE Off

			Blend SrcAlpha OneMinusSrcAlpha

			CGPROGRAM
			#pragma vertex VS_main
			#pragma fragment PS_main

			#include "UnityCG.cginc"

			#include "Base/ShaderVertex_Effect_SpriteStudio6.cginc"

			#include "Base/ShaderPixel_Effect_SpriteStudio6.cginc"

			ENDCG

			SetTexture [_MainTex]	{
				Combine Texture, Texture
			}
		}
	}
	FallBack Off
}
