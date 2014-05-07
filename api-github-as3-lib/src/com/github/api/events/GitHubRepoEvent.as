package com.github.api.events
{
	import com.github.api.vo.GitHubUser;
	
	import flash.events.Event;
	
	public class GitHubRepoEvent extends Event
	{
		public static const GET_WATCHED_COMPLETE:String = "getWatchedComplete";
		public static const GET_USER_REPOS_COMPLETE:String = "getUserReposComplete";
		
		public var user:GitHubUser;
		
		public function GitHubRepoEvent(type:String, user:GitHubUser, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.user = user;
			super(type, bubbles, cancelable);
		}
	}
}