Feature: Authenticated User Permissions
	In order to maintain site integrity
	As an authenticated user
	I should not be able to add/edit content or perform admin tasks

@api
Scenario: Authenticated user attempts to add content
	Given I am logged in as a user with the "authenticated" role
	Then I should not see "Add content"
	When I am on "/add"
	Then I should see "Page not found"

@api
Scenario: Authenticated user attempts to edit content
	Given users:
	| name   | mail           | status |
	| User 1 | test@user1.com | 1      |
	| User 2 | test@user2.com | 1      |
		And "Blog Post" content:
		| title | author | promote |
		| Blog  | User 1 | 1       |
	Given I am logged in as "User 2"
		And I am on "/"
	Then I follow "Blog"
		And I should not see the link "Edit"

@api
Scenario: Authenticated user attempts to access admin menu
	Given I am logged in as a user with the "authenticated" role
		And I am on "/admin"
	Then I should see "Access denied"