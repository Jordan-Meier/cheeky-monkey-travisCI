Feature: Annonymous User Permissions
	In order to ensure that only authorized users can post/edit content
		As an annoymous user
		I should not be able to post or edit content


@api
Scenario: Annonymous user can not create content
When I am an anonymous user
Then I should not see "Add content"

@api
Scenario: Annonymous user can not edit content

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
