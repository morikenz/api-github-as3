package com.github.api
{
	import com.github.api.auth.IGitHubAuth;
	
	import flash.net.URLRequestMethod;
	
	import mx.rpc.http.HTTPService;
	import mx.utils.Base64Encoder;

	public class GitHub
	{
		public var auth:IGitHubAuth;
		
		public function GitHub(auth:IGitHubAuth):void {
			this.auth = auth;
		}
	}
}