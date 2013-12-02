Feature: Contact WD for work
  In order to make my big project
  As a visitor
  I want to ask wizard development for help

  Scenario: Submit a business contact request
    Given I am a visitor
    And I am on the business contact page
    When I submit a business contact request
    Then I get a message that my message has been recieved
    And the message should be saved in the database