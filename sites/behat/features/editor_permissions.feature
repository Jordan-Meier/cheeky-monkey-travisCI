Feature: Editor Permissions
	In order to help edit own content
		As an editor
		I need to create content and edit it

@api
Scenario: Logs editor in to the site and creates content
  Given I am logged in as a user with the "editor" role
  When I follow "Add content"
  And I follow "Blog Post"
    And I fill in "Title" with "Testing"
    And I fill in "Body" with "Yay!"
    And I press "Save"
  Then I should see "Blog Post Testing has been created."
