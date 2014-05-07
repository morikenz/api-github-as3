package com.github.api.vo
{
	import mx.collections.ArrayCollection;

	/**
	 * The git hub user object.  Var names are the same as are received from the github server to 
	 * maintain integrity for json deserialization/serialization.  Even though they are not as3 
	 * standard variable names 
	 * @author chbrammer
	 * 
	 */	
	[Bindable]
	public class GitHubUser
	{
		public var blog:String;
		public var company:String;
		public var createdAt:String;
		public var email:String;
		public var followers_count:int;
		public var following_count:int;
		public var gravatar_id:String;
		public var id:int;
		public var location:String;
		public var login:String;
		public var name:String;
		public var public_gist_count:int;
		public var public_repo_count:int;
		public var type:String;
		
		public var followers:ArrayCollection = new ArrayCollection();
		public var following:ArrayCollection = new ArrayCollection();
		public var watched:ArrayCollection = new ArrayCollection();
		public var repos:ArrayCollection = new ArrayCollection();
		
		public static function parse(obj:Object):GitHubUser {
			var user:GitHubUser = new GitHubUser();
			user.blog = obj.blog;
			user.company = obj.company;
			user.createdAt = obj.createdAt;
			user.email = obj.email;
			user.followers_count = obj.followers_count;
			user.following_count = obj.following_count;
			user.gravatar_id = obj.gravatar_id;
			user.id = obj.id;
			user.location = obj.location;
			user.login = obj.login;
			user.name = obj.name;
			user.public_gist_count = obj.public_gist_count;
			user.public_repo_count = obj.public_repo_count;
			user.type = obj.type;
			return user;
		}
	}
}