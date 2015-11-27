//
//  RepoEntityTest.m
//  Test_iOS_antjimar
//
//  Created by ANTONIO JIMÉNEZ MARTÍNEZ on 27/11/15.
//  Copyright © 2015 Antonio. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "InMemoryCoreDataStack.h"
#import "RepoEntity.h"

@interface RepoEntityTest : XCTestCase
@property (nonatomic, strong) InMemoryCoreDataStack *coreDataStack;
@property (nonatomic, readonly) NSManagedObjectContext *managedObjectContext;
@end

@implementation RepoEntityTest

- (void)setUp {
    [super setUp];
    self.coreDataStack = [[InMemoryCoreDataStack alloc] initWithModelName:@"Test_iOS_antjimar"];
}

- (NSManagedObjectContext *)managedObjectContext {
    return self.coreDataStack.managedObjectContext;
}

- (void)tearDown {
    self.coreDataStack = nil;
    [super tearDown];
}

- (void)testSaveNewRepoEntity {
    NSDictionary *repoDict = @{
                               @"id": @(2399148),
                               @"name": @"absurdity",
                               @"full_name": @"xing/absurdity",
                               @"owner": @{
                                       @"login": @"xing",
                                       @"id": @(27901),
                                       @"avatar_url": @"https://avatars.githubusercontent.com/u/27901?v=3",
                                       @"gravatar_id": @"",
                                       @"url": @"https://api.github.com/users/xing",
                                       @"html_url": @"https://github.com/xing",
                                       @"followers_url": @"https://api.github.com/users/xing/followers",
                                       @"following_url": @"https://api.github.com/users/xing/following{/other_user}",
                                       @"gists_url": @"https://api.github.com/users/xing/gists{/gist_id}",
                                       @"starred_url": @"https://api.github.com/users/xing/starred{/owner}{/repo}",
                                       @"subscriptions_url": @"https://api.github.com/users/xing/subscriptions",
                                       @"organizations_url": @"https://api.github.com/users/xing/orgs",
                                       @"repos_url": @"https://api.github.com/users/xing/repos",
                                       @"events_url": @"https://api.github.com/users/xing/events{/privacy}",
                                       @"received_events_url": @"https://api.github.com/users/xing/received_events",
                                       @"type": @"Organization",
                                       @"site_admin": @(0)
                                       },
                               @"private": @(0),
                               @"html_url": @"https://github.com/xing/absurdity",
                               @"description": @"Absurdly simple AB testing framework",
                               @"fork": @(0),
                               @"url": @"https://api.github.com/repos/xing/absurdity",
                               @"forks_url": @"https://api.github.com/repos/xing/absurdity/forks",
                               @"keys_url": @"https://api.github.com/repos/xing/absurdity/keys{/key_id}",
                               @"collaborators_url": @"https://api.github.com/repos/xing/absurdity/collaborators{/collaborator}",
                               @"teams_url": @"https://api.github.com/repos/xing/absurdity/teams",
                               @"hooks_url": @"https://api.github.com/repos/xing/absurdity/hooks",
                               @"issue_events_url": @"https://api.github.com/repos/xing/absurdity/issues/events{/number}",
                               @"events_url": @"https://api.github.com/repos/xing/absurdity/events",
                               @"assignees_url": @"https://api.github.com/repos/xing/absurdity/assignees{/user}",
                               @"branches_url": @"https://api.github.com/repos/xing/absurdity/branches{/branch}",
                               @"tags_url": @"https://api.github.com/repos/xing/absurdity/tags",
                               @"blobs_url": @"https://api.github.com/repos/xing/absurdity/git/blobs{/sha}",
                               @"git_tags_url": @"https://api.github.com/repos/xing/absurdity/git/tags{/sha}",
                               @"git_refs_url": @"https://api.github.com/repos/xing/absurdity/git/refs{/sha}",
                               @"trees_url": @"https://api.github.com/repos/xing/absurdity/git/trees{/sha}",
                               @"statuses_url": @"https://api.github.com/repos/xing/absurdity/statuses/{sha}",
                               @"languages_url": @"https://api.github.com/repos/xing/absurdity/languages",
                               @"stargazers_url": @"https://api.github.com/repos/xing/absurdity/stargazers",
                               @"contributors_url": @"https://api.github.com/repos/xing/absurdity/contributors",
                               @"subscribers_url": @"https://api.github.com/repos/xing/absurdity/subscribers",
                               @"subscription_url": @"https://api.github.com/repos/xing/absurdity/subscription",
                               @"commits_url": @"https://api.github.com/repos/xing/absurdity/commits{/sha}",
                               @"git_commits_url": @"https://api.github.com/repos/xing/absurdity/git/commits{/sha}",
                               @"comments_url": @"https://api.github.com/repos/xing/absurdity/comments{/number}",
                               @"issue_comment_url": @"https://api.github.com/repos/xing/absurdity/issues/comments{/number}",
                               @"contents_url": @"https://api.github.com/repos/xing/absurdity/contents/{+path}",
                               @"compare_url": @"https://api.github.com/repos/xing/absurdity/compare/{base}...{head}",
                               @"merges_url": @"https://api.github.com/repos/xing/absurdity/merges",
                               @"archive_url": @"https://api.github.com/repos/xing/absurdity/{archive_format}{/ref}",
                               @"downloads_url": @"https://api.github.com/repos/xing/absurdity/downloads",
                               @"issues_url": @"https://api.github.com/repos/xing/absurdity/issues{/number}",
                               @"pulls_url": @"https://api.github.com/repos/xing/absurdity/pulls{/number}",
                               @"milestones_url": @"https://api.github.com/repos/xing/absurdity/milestones{/number}",
                               @"notifications_url": @"https://api.github.com/repos/xing/absurdity/notifications{?since,all,participating}",
                               @"labels_url": @"https://api.github.com/repos/xing/absurdity/labels{/name}",
                               @"releases_url": @"https://api.github.com/repos/xing/absurdity/releases{/id}",
                               @"created_at": @"2011-09-16T12:34:03Z",
                               @"updated_at": @"2015-11-05T11:41:58Z",
                               @"pushed_at": @"2012-06-09T17:25:45Z",
                               @"git_url": @"git://github.com/xing/absurdity.git",
                               @"ssh_url": @"git@github.com:xing/absurdity.git",
                               @"clone_url": @"https://github.com/xing/absurdity.git",
                               @"svn_url": @"https://github.com/xing/absurdity",
                               @"homepage": @"",
                               @"size": @(154),
                               @"stargazers_count": @(63),
                               @"watchers_count": @(63),
                               @"language": @"Ruby",
                               @"has_issues": @(1),
                               @"has_downloads": @(1),
                               @"has_wiki": @(1),
                               @"has_pages": @(0),
                               @"forks_count": @(7),
                               @"mirror_url": [NSNull null],
                               @"open_issues_count": @(1),
                               @"forks": @(7),
                               @"open_issues": @(1),
                               @"watchers": @(63),
                               @"default_branch": @"master"
                               };
    
    RepoEntity *repoEntity = [RepoEntity parseRepoByDictionary:repoDict inManagedObjectContext:self.managedObjectContext];
    XCTAssertNotNil(repoEntity);
    XCTAssertEqualObjects(repoEntity.repoEntityId, @"2399148");
    XCTAssertEqualObjects(repoEntity.repoEntityName, @"absurdity");
    XCTAssertEqualObjects(repoEntity.repoEntityDescription, @"Absurdly simple AB testing framework");
    XCTAssertEqualObjects(repoEntity.repoEntityOwnerLogin, @"xing");
    XCTAssertEqualObjects(repoEntity.repoEntityFork, @(0));

}

- (void)testSaveNewRepoEntityWithoutFork {
    NSDictionary *repoDict = @{
                               @"id": @(2399148),
                               @"name": @"absurdity",
                               @"full_name": @"xing/absurdity",
                               @"owner": @{
                                       @"login": @"xing",
                                       @"id": @(27901),
                                       @"avatar_url": @"https://avatars.githubusercontent.com/u/27901?v=3",
                                       @"gravatar_id": @"",
                                       @"url": @"https://api.github.com/users/xing",
                                       @"html_url": @"https://github.com/xing",
                                       @"followers_url": @"https://api.github.com/users/xing/followers",
                                       @"following_url": @"https://api.github.com/users/xing/following{/other_user}",
                                       @"gists_url": @"https://api.github.com/users/xing/gists{/gist_id}",
                                       @"starred_url": @"https://api.github.com/users/xing/starred{/owner}{/repo}",
                                       @"subscriptions_url": @"https://api.github.com/users/xing/subscriptions",
                                       @"organizations_url": @"https://api.github.com/users/xing/orgs",
                                       @"repos_url": @"https://api.github.com/users/xing/repos",
                                       @"events_url": @"https://api.github.com/users/xing/events{/privacy}",
                                       @"received_events_url": @"https://api.github.com/users/xing/received_events",
                                       @"type": @"Organization",
                                       @"site_admin": @(0)
                                       },
                               @"private": @(0),
                               @"html_url": @"https://github.com/xing/absurdity",
                               @"description": @"Absurdly simple AB testing framework",
                               @"fork": [NSNull null],
                               @"url": @"https://api.github.com/repos/xing/absurdity",
                               @"forks_url": @"https://api.github.com/repos/xing/absurdity/forks",
                               @"keys_url": @"https://api.github.com/repos/xing/absurdity/keys{/key_id}",
                               @"collaborators_url": @"https://api.github.com/repos/xing/absurdity/collaborators{/collaborator}",
                               @"teams_url": @"https://api.github.com/repos/xing/absurdity/teams",
                               @"hooks_url": @"https://api.github.com/repos/xing/absurdity/hooks",
                               @"issue_events_url": @"https://api.github.com/repos/xing/absurdity/issues/events{/number}",
                               @"events_url": @"https://api.github.com/repos/xing/absurdity/events",
                               @"assignees_url": @"https://api.github.com/repos/xing/absurdity/assignees{/user}",
                               @"branches_url": @"https://api.github.com/repos/xing/absurdity/branches{/branch}",
                               @"tags_url": @"https://api.github.com/repos/xing/absurdity/tags",
                               @"blobs_url": @"https://api.github.com/repos/xing/absurdity/git/blobs{/sha}",
                               @"git_tags_url": @"https://api.github.com/repos/xing/absurdity/git/tags{/sha}",
                               @"git_refs_url": @"https://api.github.com/repos/xing/absurdity/git/refs{/sha}",
                               @"trees_url": @"https://api.github.com/repos/xing/absurdity/git/trees{/sha}",
                               @"statuses_url": @"https://api.github.com/repos/xing/absurdity/statuses/{sha}",
                               @"languages_url": @"https://api.github.com/repos/xing/absurdity/languages",
                               @"stargazers_url": @"https://api.github.com/repos/xing/absurdity/stargazers",
                               @"contributors_url": @"https://api.github.com/repos/xing/absurdity/contributors",
                               @"subscribers_url": @"https://api.github.com/repos/xing/absurdity/subscribers",
                               @"subscription_url": @"https://api.github.com/repos/xing/absurdity/subscription",
                               @"commits_url": @"https://api.github.com/repos/xing/absurdity/commits{/sha}",
                               @"git_commits_url": @"https://api.github.com/repos/xing/absurdity/git/commits{/sha}",
                               @"comments_url": @"https://api.github.com/repos/xing/absurdity/comments{/number}",
                               @"issue_comment_url": @"https://api.github.com/repos/xing/absurdity/issues/comments{/number}",
                               @"contents_url": @"https://api.github.com/repos/xing/absurdity/contents/{+path}",
                               @"compare_url": @"https://api.github.com/repos/xing/absurdity/compare/{base}...{head}",
                               @"merges_url": @"https://api.github.com/repos/xing/absurdity/merges",
                               @"archive_url": @"https://api.github.com/repos/xing/absurdity/{archive_format}{/ref}",
                               @"downloads_url": @"https://api.github.com/repos/xing/absurdity/downloads",
                               @"issues_url": @"https://api.github.com/repos/xing/absurdity/issues{/number}",
                               @"pulls_url": @"https://api.github.com/repos/xing/absurdity/pulls{/number}",
                               @"milestones_url": @"https://api.github.com/repos/xing/absurdity/milestones{/number}",
                               @"notifications_url": @"https://api.github.com/repos/xing/absurdity/notifications{?since,all,participating}",
                               @"labels_url": @"https://api.github.com/repos/xing/absurdity/labels{/name}",
                               @"releases_url": @"https://api.github.com/repos/xing/absurdity/releases{/id}",
                               @"created_at": @"2011-09-16T12:34:03Z",
                               @"updated_at": @"2015-11-05T11:41:58Z",
                               @"pushed_at": @"2012-06-09T17:25:45Z",
                               @"git_url": @"git://github.com/xing/absurdity.git",
                               @"ssh_url": @"git@github.com:xing/absurdity.git",
                               @"clone_url": @"https://github.com/xing/absurdity.git",
                               @"svn_url": @"https://github.com/xing/absurdity",
                               @"homepage": @"",
                               @"size": @(154),
                               @"stargazers_count": @(63),
                               @"watchers_count": @(63),
                               @"language": @"Ruby",
                               @"has_issues": @(1),
                               @"has_downloads": @(1),
                               @"has_wiki": @(1),
                               @"has_pages": @(0),
                               @"forks_count": @(7),
                               @"mirror_url": [NSNull null],
                               @"open_issues_count": @(1),
                               @"forks": @(7),
                               @"open_issues": @(1),
                               @"watchers": @(63),
                               @"default_branch": @"master"
                               };
    
    RepoEntity *repoEntity = [RepoEntity parseRepoByDictionary:repoDict inManagedObjectContext:self.managedObjectContext];
    XCTAssertNotNil(repoEntity);
    XCTAssertEqualObjects(repoEntity.repoEntityId, @"2399148");
    XCTAssertEqualObjects(repoEntity.repoEntityName, @"absurdity");
    XCTAssertEqualObjects(repoEntity.repoEntityDescription, @"Absurdly simple AB testing framework");
    XCTAssertEqualObjects(repoEntity.repoEntityOwnerLogin, @"xing");
    XCTAssertNil(repoEntity.repoEntityFork);

}

@end
