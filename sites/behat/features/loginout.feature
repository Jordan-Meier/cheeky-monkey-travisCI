Feature: Log in and out of the site
	In order to maintain an account
		As a visitor
		I need to log in and out of the site

Scenario: Logs in to the site
	Given I am on "/"
	When I fill in "Username" with "TestUser"
		And I fill in "Password" with "test"
		And I press "Log in"
	Then I should see "Log out"
		And I should see "My account"

Scenario: Logs out of the site
	Given I am on "/"
	When I fill in "Username" with "TestUser"
		And I fill in "Password" with "test"
		And I press "Log in"
		And I follow "Log out"
	Then I should see "Log in"
		And I should not see "My account"

Scenario: Error messages for no input values
	Given I am on "/user"
    When I press "Log in"
    Then I should see the following error messages:
    | error messages             |
    | Username field is required |
    | Password field is required |