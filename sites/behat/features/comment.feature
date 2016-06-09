Feature: Comment Permissions
   In order to keep trolls from writing comments
    As a site admin
    I need to limit commenting ability to authenticated users

@api
Scenario: An Unauthenticated User cannot see the comment form
	Given users:
	| name             | mail          | status |
	| BDD TESTING User | test@test.com | 1      |
		And "article" content:
		| title                 | author           | body        | promote |
		| BDD TESTING Test Blog | BDD TESTING User | PLACEHOLDER | 1       |
	Given I am not logged in
		And I am viewing a "Blog Post" with the title "BDD TESTING Test Blog"
	Then I should see "Log in or register to post comments"
		And I should not see "Add new comment"