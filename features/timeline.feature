Feature: Timeline

  As a user
  I want to add and edit events in a timeline

  Scenario: View events
    Given a timeline 'Some Timeline' with 3 events
    When I navigate to the timeline
    Then there should be 3 events visible

  Scenario: Add new event
    Given a timeline 'Some Timeline'
    When I navigate to the timeline
    And I click on 'Create New'
    Then I should be on the new event page for 'Some Timeline'

  Scenario: Create event
    Given a timeline 'Some Timeline'
    When I navigate to its new event page
    And I input 'Some Event' for 'event_title'
    And I click on 'Create Event'
    Then I should be on the page for timeline 'Some Timeline'
    And there should be an event entitled 'Some Event' visible

