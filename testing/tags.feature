Feature: IF Tags are defined than it should have required values
  In order to improve consitancy across the resource
  As engineers
  We'll use tags to recognized the resources ownership

Scenario Outline: Ensure that specific tags are defined
    Given I have resource that supports tags defined
    When it has tags
    Then it must contain tags
    Then it must contain "<tags>"
    And its value must match the "<value>" regex

    Examples:
      | tags        | value              |
      | Name        | .+                 |
      | application | .+                 |
      | role        | .+                 |
      | environment | ^(prod\|uat\|dev)$ |
