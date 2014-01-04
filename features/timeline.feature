Feature: Timeline

  As a user
  I want to add and edit events in a timeline

  Scenario: View events
    Given a timeline "Some Timeline" with 3 events
    When I navigate to the timeline
    Then there should be 3 events visible

  Scenario: Add new event link
    Given a timeline "Some Timeline"
    When I navigate to the timeline
    And I click on "Create New"
    Then I should be on the new event page for "Some Timeline"

  Scenario: Create event
    Given a timeline "Some Timeline"
    When I navigate to the new event page for the timeline
    And I input "Some Event" for "event_title"
    And I click on "Create Event"
    Then I should be on the page for timeline "Some Timeline"
    And there should be an event entitled "Some Event" visible

  Scenario: Event validation
    Given a timeline "Some Timeline"
    When I navigate to the new event page for the timeline
    And I input "" for "event_title"
    And I click on "Create Event"
    Then there should be an error "Title can't be blank"
    
  Scenario: Search for event link
    Given a timeline "Some Timeline"
    When I navigate to the timeline
    And I click on "Add Existing"
    Then I should be on the search event page for "Some Timeline"

  Scenario: Search for event
    Given an event "Some Event"
    And a timeline "Some Timeline"
    When I navigate to the search page for the timeline
    And I input "Event" for "query"
    And I click on "Search"
    Then there should be an event entitled "Some Event" visible
    
  Scenario: Add existing event to timeline
    Given an event "Some Event"
    And a timeline "Some Timeline"
    And I navigate to the search page for the timeline
    When I input "Event" for "query"
    And I click on "Search"
    And I click on "Add Event"
    Then I should be on the page for timeline "Some Timeline"
    And there should be an event entitled "Some Event" visible
    