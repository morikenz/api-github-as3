package com.github.api.util
{
	import com.github.api.GitHub;
	import com.github.api.auth.IGitHubAuth;
	
	import flash.net.URLRequestMethod;
	
	import mx.rpc.http.HTTPService;

	public class GitHubUtils
	{
//		public static function createRequest(uf:Unfuddle, url:String, data:Object = null, method:String = URLRequestMethod.GET):URLRequest {
//			var req:URLRequest = new URLRequest();
//			req.url = uf.baseUrl + url;
//			req.method = method;
//			req.data = data;
//			req.requestHeaders = new Array(
//				new URLRequestHeader("Content-Type", "application/xml"), 
//				new URLRequestHeader("Accept", "application/xml"), 
//				new URLRequestHeader("Authorization", uf.authHeader));
//			return req;
//		}
		
		public static function createHTTPService(auth:IGitHubAuth, url:String, data:Object = null, method:String = URLRequestMethod.GET):HTTPService {
			var srv:HTTPService = new HTTPService();
			srv.headers["Authorization"] = auth.authHeader;
			srv.headers["username"] = auth.authHeader;
//			srv.headers["Accept"] = "application/xml";
//			srv.headers["Content-type"] = "application/xml";
			srv.resultFormat = "text";
			srv.url = url
			srv.method = method;
			return srv;
		}
	}
}