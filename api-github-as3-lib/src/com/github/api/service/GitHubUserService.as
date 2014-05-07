package com.github.api.service
{
	import com.adobe.serialization.json.JSON;
	import com.adobe.serialization.json.JSONDecoder;
	import com.github.api.GitHub;
	import com.github.api.events.GitHubUserEvent;
	import com.github.api.util.GitHubUtils;
	import com.github.api.vo.GitHubRepo;
	import com.github.api.vo.GitHubUser;
	
	import flash.events.EventDispatcher;
	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class GitHubUserService extends EventDispatcher
	{
		public var account:GitHub;
		
		public var user:GitHubUser;
		
		public function GitHubUserService(account:GitHub)
		{
			this.account = account;
		}
		
		//*************************************
		// Get user
		//*************************************
		
		public function getUser(username:String):void {
			var url:String = "http://github.com/api/v2/json/user/show/" + username;
			var service:HTTPService = GitHubUtils.createHTTPService(account.auth, url); 
			service.addEventListener(ResultEvent.RESULT, onGetUser);
			service.addEventListener(FaultEvent.FAULT, onFault);
			service.send();
		}
		
		public function onGetUser(e:ResultEvent):void {
			var rawData:String = String(e.result);
			var obj:Object = JSON.decode(rawData);
			var user:GitHubUser = GitHubUser.parse(obj.user);
			dispatchEvent(new GitHubUserEvent(GitHubUserEvent.GET_USER_COMPLETE, user));
		}

		//*************************************
		// Get Following
		//*************************************
		
		public function getFollowing(user:GitHubUser):void {
			this.user = user;
			var url:String = "http://github.com/api/v2/json/user/show/" + user.login + "/following";
			var service:HTTPService = GitHubUtils.createHTTPService(account.auth, url); 
			service.addEventListener(ResultEvent.RESULT, onGetFollowing);
			service.addEventListener(FaultEvent.FAULT, onFault);
			service.send();
		}
		
		public function onGetFollowing(e:ResultEvent):void {
			var rawData:String = String(e.result);
			var obj:Object = JSON.decode(rawData);
			var users:Array = obj.users as Array;
			user.following.removeAll();
			for each(var userObj:Object in users) {
				var user:GitHubUser = new GitHubUser();
				user.login = userObj.toString();
				user.following.addItem(user);
			} 
			dispatchEvent(new GitHubUserEvent(GitHubUserEvent.GET_FOLLOWING_COMPLETE, user));
		}

		//*************************************
		// Get Followers
		//*************************************
		
		public function getFollowers(user:GitHubUser):void {
			this.user = user;
			var url:String = "http://github.com/api/v2/json/user/show/" + user.login + "/followers";
			var service:HTTPService = GitHubUtils.createHTTPService(account.auth, url); 
			service.addEventListener(ResultEvent.RESULT, onGetFollowers);
			service.addEventListener(FaultEvent.FAULT, onFault);
			service.send();
		}
		
		public function onGetFollowers(e:ResultEvent):void {
			var rawData:String = String(e.result);
			var obj:Object = JSON.decode(rawData);
			var users:Array = obj.users as Array;
			user.followers.removeAll();
			for each(var userObj:Object in users) {
				var user:GitHubUser = new GitHubUser();
				user.login = userObj.toString();
				user.followers.addItem(user);
			} 
			dispatchEvent(new GitHubUserEvent(GitHubUserEvent.GET_FOLLOWERS_COMPLETE, user));
		}
		
		//*************************************
		// Get Keys
		//*************************************
		
		// TODO this doenst work, keeps giving back a 401 not authorized
		public function getKeys(user:GitHubUser):void {
			this.user = user;
			var url:String = "http://github.com/api/v2/json/user/keys";
			var service:HTTPService = GitHubUtils.createHTTPService(account.auth, url); 
			service.addEventListener(ResultEvent.RESULT, onGetKeys);
			service.addEventListener(FaultEvent.FAULT, onFault);
			service.send();
		}
		
		public function onGetKeys(e:ResultEvent):void {
			var rawData:String = String(e.result);
			var obj:Object = JSON.decode(rawData);
			dispatchEvent(new GitHubUserEvent(GitHubUserEvent.GET_FOLLOWERS_COMPLETE, user));
		}
		
		private function onFault(e:FaultEvent):void {
			dispatchEvent(e);
		}
		
	}
}