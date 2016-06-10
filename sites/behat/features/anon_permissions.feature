Feature: Anonymous User Permissions
	In order to ensure that only authorized users can post/edit content
		As an annoymous user
		I should not be able to post or edit content

#There are a few scenarios in other features (account.feature, comment.feature, contact_form.feature) that account for other anonymous user stories.

@api
Scenario: Anonymous user can not create content
When I am an anonymous user
Then I should not see "Add content"

@api
Scenario: Anonymous user can not edit content

	Given users:
		| name   | status |
		| User   | 1      |
	And "Blog Post" content:
		| title            | author | body             | promote |
		| Here is a Title  | User   | PLACEHOLDER BODY | 1       |
	When I am an anonymous user
    And I am on "/blog"
		And I follow "Here is a Title"
	Then I should not see the link "Edit"

@api
Scenario: Anon user attempts to access admin menu
    Given I am an anonymous user
      And I am on "/admin"
    Then I should see "You are not authorized to access this page."
