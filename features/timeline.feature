Feature: Timeline

  As a user
  I want to add and edit events in a timeline

  Scenario: View events
    Given a timeline 'Some Timeline' with 3 events
    When I navigate to the timeline 'Some Timeline'
    Then there should be 3 events visible

  Scenario: Create event
    Given a timeline 'Some Timeline'
    When I navigate to the timeline 'Some Timeline'
    And I click on 'Create New'
    Then I should be on the new event page for 'Some Timeline'

    