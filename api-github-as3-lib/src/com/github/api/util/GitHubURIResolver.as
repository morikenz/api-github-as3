package com.github.api.util
{
	public class GitHubURIResolver
	{
		public static function oath_authorize(clientId:int, redirect:String, scope:String):String {
			return "";//"https://github.com/login/oauth/authorize?{client_id}{redirect_uri}{scope}
		}
	}
}