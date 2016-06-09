Feature: Submit contact form
	In order to receive user feedback
		As a visitor
		I need to be able to fill out the contact form

Scenario: Fills out website feedback form
	Given I am on "/contact"
	When I fill in "Your name" with "Bob Ross"
		And I fill in "Your e-mail address" with "happylittletrees@br.com"
    And I fill in "Subject" with "Yay!"
    And I fill in "Message" with "This is the best!"
		And I press "Send message"
	Then I should see "Your message has been sent."

	Scenario: Error messages for no input values
		Given I am on "/contact"
	    When I press "Send message"
	    Then I should see the following error messages:
			| error messages             |
			| Your name field is required |
			| Your e-mail address field is required |
			| Subject field is required |
			| Message field is required |
