Feature: Tags are defined to all the resources
  In order to improve operation visibilty
  As engineers
  We'll use tags to recognized the resources ownership

  Scenario: Ensure all resources have tags
    Given I have resource that supports tags defined
    Then it must contain tags
    And its value must not be null
