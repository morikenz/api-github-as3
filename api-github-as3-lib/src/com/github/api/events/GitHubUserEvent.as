package com.github.api.events
{
	import com.github.api.vo.GitHubUser;
	
	import flash.events.Event;
	
	public class GitHubUserEvent extends Event
	{
		public static const GET_USER_COMPLETE:String = "getUserComplete";
		public static const GET_FOLLOWING_COMPLETE:String = "getFollowingComplete";
		public static const GET_FOLLOWERS_COMPLETE:String = "getFollowersComplete";
		
		public var user:GitHubUser;
		
		public function GitHubUserEvent(type:String, user:GitHubUser, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.user = user;
			super(type, bubbles, cancelable);
		}
	}
}