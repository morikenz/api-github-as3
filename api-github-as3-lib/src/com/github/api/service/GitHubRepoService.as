package com.github.api.service
{
	import com.adobe.serialization.json.JSON;
	import com.github.api.GitHub;
	import com.github.api.events.GitHubRepoEvent;
	import com.github.api.events.GitHubUserEvent;
	import com.github.api.util.GitHubUtils;
	import com.github.api.vo.GitHubRepo;
	import com.github.api.vo.GitHubUser;
	
	import flash.events.EventDispatcher;
	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class GitHubRepoService extends EventDispatcher
	{
		public var account:GitHub;
		
		public var user:GitHubUser;
		
		public function GitHubRepoService(account:GitHub)
		{
			this.account = account;
		}
	
		
		//*************************************
		// Get Watched
		//*************************************
		
		public function getWatched(user:GitHubUser):void {
			this.user = user;
			var url:String = "http://github.com/api/v2/json/repos/watched/" + user.login;
			var service:HTTPService = GitHubUtils.createHTTPService(account.auth, url); 
			service.addEventListener(ResultEvent.RESULT, onGetWatched);
			service.addEventListener(FaultEvent.FAULT, onFault);
			service.send();
		}
		
		public function onGetWatched(e:ResultEvent):void {
			var rawData:String = String(e.result);
			var obj:Object = JSON.decode(rawData);
			var repos:Array = obj.repositories as Array;
			user.watched.removeAll();
			for each(var repoObj:Object in repos) {
				var repo:GitHubRepo = GitHubRepo.parse(repoObj);
				user.watched.addItem(repo);
			} 
			dispatchEvent(new GitHubRepoEvent(GitHubRepoEvent.GET_WATCHED_COMPLETE, user));
		}
		
		
		//*************************************
		// Get Repos
		//*************************************
		
		public function getRepos(user:GitHubUser):void {
			this.user = user;
			var url:String = "http://github.com/api/v2/json/repos/show/" + user.login;
			var service:HTTPService = GitHubUtils.createHTTPService(account.auth, url); 
			service.addEventListener(ResultEvent.RESULT, onGetRepos);
			service.addEventListener(FaultEvent.FAULT, onFault);
			service.send();
		}
		
		public function onGetRepos(e:ResultEvent):void {
			var rawData:String = String(e.result);
			var obj:Object = JSON.decode(rawData);
			var repos:Array = obj.repositories as Array;
			user.repos.removeAll();
			for each(var repoObj:Object in repos) {
				var repo:GitHubRepo = GitHubRepo.parse(repoObj);
				user.repos.addItem(repo);
			} 
			dispatchEvent(new GitHubRepoEvent(GitHubRepoEvent.GET_USER_REPOS_COMPLETE, user));
		}
		
		
		
		private function onFault(e:FaultEvent):void {
			dispatchEvent(e);
		}
		
	}
}