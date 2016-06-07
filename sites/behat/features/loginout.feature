Feature: Log in and out of the site
	In order to maintain an account
		As a visitor
		I need to log in and out of the site

Scenario: Logs in to the site
	Given I am on "/"
	When I follow "Log In"
		And I fill in "username" with "admin"
		And I fill in "password" with "cheekybehatmonkey"
		And I press "Log in"
	Then I should see "Log out"
		And I should see "My account"