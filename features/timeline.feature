Feature: Timeline

  As a user
  I want to add and edit events in a timeline

  Scenario: View events
    Given a timeline 'Iranian Revolution' with 3 events
    When I navigate to the timeline 'Iranian Revolution'
    Then there should be 3 events visible
