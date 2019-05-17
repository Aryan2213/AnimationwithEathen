Shader "Intro Shader/with JayRay/EthanShader"
{
	Properties
	{
  	  // Variable Name("Display Name",Data Type ) = Value
	  // DONT SEMI CLOON THIS PART
	  _MainTexture ("Diffuse Texture", 2D) = "white"{}// This is 2D Texture\
	  _NormalTexture ("Normal Texture", 2D) = "white"{}// This is 2D Texture\
	  _EmissionTexture ("Emission Texture",2D) = "White"{}
	  _EmissionColour("Emission",Color) = (0,0,0,0) 
	  _TintColour ("Tint",Color) = (1,1,1,1)
	  
	}	
	SubShader 
	{
		Tags
		{
	        "RenderType" = "Opaque"
		}
		//SEMI COLON FROM HERE
		CGPROGRAM
		// Tell us Type of Shader
		#pragma surface test Lambert //finalcolor:mycolor
		//connect the VariableName to the CG code
		sampler2D _MainTexture;
		sampler2D  _EmissionTexture;
		sampler2D  _NormalTexture;

		fixed4 _EmissionColour;
		fixed4 _TintColour;
		

		struct Input
		{
		// UV coordinates
		float2 uv_MainTexture;
		float2 uv_NormalTexture;
		float2 uv_EmissionTexture;
		};
		void mycolur(Input IN,SurfaceOutput o ,inout fixed4 colour)
		{
		colour *= _TintColour;
		colour *= _EmissionColour;
		
		}



		void test (Input IN,inout SurfaceOutput o)
		{
			o.Albedo = tex2D (_MainTexture, IN.uv_MainTexture).rgb;
			o.Emission = tex2D(_EmissionTexture, IN.uv_EmissionTexture).rgb;
			//o.Normal = UnpackedNormal(tex2D(_NormalTexture,IN.uv_NormalTexture));
		}
		ENDCG
		//NO MORE SEMI COLON FREOM HERE
	}
	FallBack "Diffuse"
}
