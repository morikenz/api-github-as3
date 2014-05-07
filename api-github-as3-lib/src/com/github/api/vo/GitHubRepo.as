package com.github.api.vo
{
	public class GitHubRepo
	{
		
		public var created_at:String;
		public var description:String;
		public var fork:Boolean;
		public var forks:int;
		public var has_downloads:Boolean;
		public var has_issues:Boolean;
		public var has_wiki:Boolean;
		public var homepage:String;
		public var name:String;
		public var open_issues:int;
		public var owner:String;
		public var isPrivate:Boolean;
		public var pushed_at:String;
		public var url:String;
		public var watchers:int;
		
		
		public static function parse(obj:Object):GitHubRepo {
			var repo:GitHubRepo = new GitHubRepo();
			repo.created_at = obj.created_at;
			repo.description = obj.description;
			repo.fork = obj.fork;
			repo.forks = obj.forks;
			repo.has_downloads = obj.has_downloads;
			repo.has_issues = obj.has_issues;
			repo.has_wiki = obj.has_wiki;
			repo.homepage = obj.homepage;
			repo.name = obj.name;
			repo.open_issues = obj.open_issues;
			repo.isPrivate = obj.private;
			repo.pushed_at = obj.pushed_at;
			repo.url = obj.url;
			repo.watchers = obj.watchers;
			return repo;
		}
	}
}