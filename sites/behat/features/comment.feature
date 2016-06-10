Feature: Comment Permissions
   In order to keep trolls from writing comments
    As a site admin
    I need to limit commenting ability to authenticated users

@api
Scenario: An Unauthenticated User cannot see the comment form
	Given users:
	| name | mail          | status |
	| User | test@test.com | 2      |
		And "Blog Post" content:
		| title     | author | body                  | promote |
		| Test Blog | User   | Placeholder Body Text | 1       |
	Given I am not logged in
		And I am viewing a "Blog Post" with the title "Test Blog"
	Then I should see "Log in or register to post comments"
		And I should not see "Add new comment"

@api
Scenario: An Authenticated User gets an error message when attempting to post a comment
	Given users:
	| name      | mail             | status |
	| Commenter | testing@test.com | 1      |
	| dudeman   | test@test.com    | 2      |
		And "Blog Post" content:
		| title     | author | body                  | promote |
		| Test Blog | dudeman | Placeholder Body Text | 1       |
	Given I am logged in as "Commenter"
		And I am viewing a "Blog Post" with the title "Test Blog"
		And I press "Save"
	Then I should see the error message "Comment field is required."

@api
Scenario: An Authenticated User can comment on a post
	Given users:
	| name      | mail             | status    |
	| Commenter | testing@test.com | 1         |
	| dudeman   | test@test.com    | 2         |
		And "Blog Post" content:
		| title     | author       | body                  | promote |
		| Test Blog | dudeman      | Placeholder Body Text | 1       |
	Given I am logged in as "Commenter"
		And I am viewing a "Blog Post" with the title "Test Blog"
	Then I fill in "Subject" with "Test Subject"
		And I fill in "Comment" with "Placeholder Comment Text"
		And I press "Save"
	Then I should see the success message "Your comment has been posted."
