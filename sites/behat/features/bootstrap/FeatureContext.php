<?php

use Behat\Behat\Tester\Exception\PendingException;
use Drupal\DrupalExtension\Context\RawDrupalContext;
use Behat\Behat\Context\SnippetAcceptingContext;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;
use Behat\Behat\Hook\Scope\AfterScenarioScope;

/**
 * Defines application features from the specific context.
 */
class FeatureContext extends RawDrupalContext implements SnippetAcceptingContext {

  /**
   * Initializes context.
   *
   * Every scenario gets its own context instance.
   * You can also pass arbitrary arguments to the
   * context constructor through behat.yml.
   */
  public function __construct() {
  }

  // Scrub non-Drupal API preceded tests clean of users after running
  /** @AfterScenario */
  public function after(AfterScenarioScope $scope) {
  	$query = new EntityFieldQuery();
    $result = $query->entityCondition('entity_type', 'user')
                    ->propertyCondition('name', 'BDD TESTING', 'STARTS_WITH')
                    ->execute();
    if (isset($result['user'])) {
      $uids = array_keys($result['user']);
      foreach ($uids as $uid) {
        user_delete($uid);
      }
    }
  }

}
