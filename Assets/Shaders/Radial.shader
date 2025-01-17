﻿Shader "Custom/Radial"
{
    Properties
    {
        [PerRendererData] _MainTex ("Main Tex", 2D) = "white" {}
        _FillAmount ("Fill Amount", Range(0, 1)) = 0.6
    }

    SubShader
    {
        Tags
        { 
            "Queue"="Transparent" 
            "IgnoreProjector"="True" 
            "RenderType"="Transparent" 
            "PreviewType"="Plane"
            "CanUseSpriteAtlas"="True"
        }

        Cull Off
        Lighting Off
        ZWrite Off
        ZTest On
        Blend SrcAlpha OneMinusSrcAlpha

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"
            #include "UnityUI.cginc"

            sampler2D _MainTex;
            float4 _MainTex_ST;

            float _FillAmount;

            struct appdata_t
            {
                float4 vertex   : POSITION;
                float4 color    : COLOR;
                float2 texcoord : TEXCOORD0;
            };

            struct v2f
            {
                float4 pos : POSITION;
                float4 color : COLOR;
                half2 uv : TEXCOORD0;
            };

            v2f vert (appdata_t v)
            {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.color = v.color;
                o.uv = TRANSFORM_TEX(v.texcoord, _MainTex);
                return o;
            }

            float4 frag (v2f i) : COLOR
            {
                float angle = atan2((i.uv.x - 0.5), -(i.uv.y - 0.5)) / 3.14159265 / 2 + 0.5;
                if(angle < 1 - _FillAmount)
                    return float4(0, 0, 0, 0);
                return tex2D(_MainTex, i.uv) * i.color;
            }

            ENDCG
        }
    }
}
