Feature: Log in and out of the site
	In order to maintain an account
		As a visitor
		I need to log in and out of the site

@api
Scenario: Logs in to the site
	Given users:
	| name             | pass         | mail             | status |
	| BDD TESTING User | testpassword | test@testing.com | 1      |
	Given I am on the homepage
	When I fill in "Username" with "BDD TESTING User"
		And I fill in "Password" with "testpassword"
		And I press "Log in"
	Then I should see "Log out"
		And I should see "My account"

@api
Scenario: Logs out of the site
	Given users:
	| name             | pass         | mail             | status |
	| BDD TESTING User | testpassword | test@testing.com | 1      |
	Given I am logged in as "BDD TESTING User"
		And I am on the homepage
	Then I should see "Log out"
		And I follow "Log out"
	Then I should see "Log in"
		And I should not see "My account"

Scenario: Error messages for no input values
	Given I am on the homepage
   When I press "Log in"
   Then I should see the following error messages:
   | error messages             |
   | Username field is required |
   | Password field is required |

@api
Scenario: Error message for incorrect information
	Given users:
	| name             | pass         | mail             | status |
	| BDD TESTING User | testpassword | test@testing.com | 1      |
	Given I am on the homepage
		And I fill in "Username" with "BDD TESTING User"
		And I fill in "Password" with "AnIncorrectPassword"
	Then I press "Log in"
		And I should see the error message "Sorry, unrecognized username or password."