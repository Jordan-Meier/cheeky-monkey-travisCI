<?php
/**
 * @file
 * contact_form.features.contact_categories.inc
 */

/**
 * Implements hook_contact_categories_defaults().
 */
function contact_form_contact_categories_defaults() {
  return array(
    'Website feedback' => array(
      'category' => 'Website feedback',
      'recipients' => 'jared@cheekymonkeymedia.ca,jordan@cheekymonkeymedia.ca',
      'reply' => 'Thanks so much for your feedback!

Someone on our team will get back to you shortly!',
      'weight' => 0,
      'selected' => 1,
    ),
  );
}
