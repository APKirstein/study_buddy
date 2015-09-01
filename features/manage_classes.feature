Feature: Manage
  In order to manage my classes
  As a user
  I want to see my full schedule

  Scenario: See classes
    Given I am a user on the home page
    And I have signed up for classes
    When I click "all"
    Then I should see "My classes"
