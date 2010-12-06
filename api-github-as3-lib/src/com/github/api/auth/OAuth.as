package com.github.api.auth
{
	import mx.utils.Base64Encoder;

	public class OAuth implements IGitHubAuth
	{
		public var username:String;
		public var token:String;
		
		public function OAuth(username:String, token:String)
		{
			this.username = username;
			this.token = token;
		}
		
		public function get authHeader():String {
			var encoder:Base64Encoder = new Base64Encoder();
			encoder.encode(username+"/token:"+token);
			var authCode:String = "Basic " + encoder.toString();
			return authCode;
		}
	}
}