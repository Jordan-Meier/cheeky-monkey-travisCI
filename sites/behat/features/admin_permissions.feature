Feature: Admin Permissions
	In order to help administer site
		As an admin
		I need to be able to perform administrative tasks

    #Some of the following tests were grabbed from the Drupal Extension to Behat and Mink Documentation found: https://behat-drupal-extension.readthedocs.io/en/3.1/drupalapi.html#enable-the-drupal-api-driver

    @api
    Scenario: Run cron
      Given I am logged in as a user with the "administrator" role
      When I run cron
      And am on "admin/reports/dblog"
      Then I should see the link "Cron run completed"

    @api
    Scenario: Clear Cache
      Given I am logged in as a user with the "administrator" role
      When the cache has been cleared
      And I am on "admin/config/development/performance"
      And I press "Clear all caches"
      Then I should see "Caches cleared."
