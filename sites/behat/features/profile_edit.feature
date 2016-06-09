Feature: User Profile Editing
	In order to manage my account
		As an authenticated user on the site
		I need to be able to edit my profile information

@api
Scenario: Recieving an error attempting to edit a different user's profile
	Given I am logged in as a user with the "authenticated" role
		And I am on "/user/1/edit"
	Then I should see "Access denied"