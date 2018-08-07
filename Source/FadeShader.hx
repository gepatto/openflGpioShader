package;

import openfl.display.DisplayObjectShader;

class FadeShader extends DisplayObjectShader {
	
	@:glFragmentSource("
		
		#pragma header
		
		uniform sampler2D img1;
		uniform sampler2D img2;
		uniform float pct;
		uniform float fade;
		
		vec3 transition(vec3 tex0, vec3 tex1, float t)
		{
    		return mix(tex0, tex1, t);	
		}

		void main(void) {
			
			#pragma body

			vec3 c1 = texture2D (img1, openfl_TextureCoordv).xyz;
			vec3 c2 = texture2D (img2, openfl_TextureCoordv).xyz;
			vec3 grayXfer = vec3(0.3, 0.59, 0.11);
			vec3 gray1 = vec3(dot(grayXfer, c1));
			vec3 gray2 = vec3(dot(grayXfer, c2));
			vec3 c1a = mix(c1, gray1, pct);
			vec3 c2a = mix(c2, gray2, pct);
			vec3 r = transition(c1a,c2a, fade);
			gl_FragColor = vec4(r,1);
			
		}
		
	")
	
	public function new () {
		
		super ();
		
	}
	
}