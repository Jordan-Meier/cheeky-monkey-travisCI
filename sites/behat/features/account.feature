Feature: Create a new user account to login and access the site
	In order to sign-in to the site
		As a visitor
		I need to be able to create a user account

Scenario: Creates a new user account
	Given I am on "/"
		And I follow "Create new account"
	Then I fill in "Username" with "BDD TESTING NEW USER"
		And I fill in "E-mail address" with "test@test.com"
		And I press "Create new account"
	Then I should see "Thank you for applying for an account. Your account is currently pending approval by the site administrator."
		And I should see "In the meantime, a welcome message with further instructions has been sent to your e-mail address."


