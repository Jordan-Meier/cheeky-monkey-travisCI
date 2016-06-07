Feature: Log in and out of the site
	In order to maintain an account
		As a visitor
		I need to log in and out of the site

Scenario: Logs in to the site
	Given I am on "/"
	When I fill in "Username" with "admin"
		And I fill in "Password" with "cheekybehatmonkey"
		And I press "Log in"
	Then I should see "Log out"
		And I should see "My account"