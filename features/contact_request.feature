Feature: Contact Request Form

  @wip @javascript
  Scenario: Filling out the contact form as a potential client
    Given I am on the homepage
    When I submit the contact request form correctly
    Then I should see a confirmation message
    And there should be mail delivered
