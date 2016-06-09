Feature: User Profile Editing
	In order to manage my account
		As an authenticated user on the site
		I need to be able to edit my profile information

@api
Scenario: Recieving an error attempting to edit a different user's profile
	Given I am logged in as a user with the "authenticated" role
		And I am on "/user/1/edit"
	Then I should see "Access denied"

@api
Scenario: Recieving error from invalid or no password when attempting to change e-mail or password
	Given users:
	| name             | pass         | mail             | status |
	| BDD TESTING User | testpassword | test@testing.com | 1 			|
	Given I am logged in as "BDD TESTING User"
		And I am on "/"
		And I follow "My account"
	Then I should see "BDD TESTING User"
	Then I follow "Edit"
		And I should see "Current password"
		And I fill in "E-mail address" with "test2@testing.com"
		And I press "Save"
	Then I should see the error message "Your current password is missing or incorrect"

@api
Scenario: Successful password change
	Given users:
	| name 						 | pass 				| mail 						 | status |
	| BDD TESTING User | testpassword | test@testing.com | 1 			|
	Given I am logged in as "BDD TESTING User"
		And I am on "/"
		And I follow "My account"
	Then I should see "BDD TESTING User"
	Then I follow "Edit"
		And I should see "Current password"
	Then I fill in "Current password" with "testpassword"
		And I fill in "Password" with "testpassword123"
		And I fill in "Confirm password" with "testpassword123"
	Then I press "Save"
		And I should see the message "The changes have been saved."
