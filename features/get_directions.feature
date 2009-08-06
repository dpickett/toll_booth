Feature: As a user of the toll_booth library
  I want to retrieve direction data
  So that I can interact with it

  Scenario: Get Routes From a Simple Trip
    Given I'm starting at "4 Yawkey Way, Boston, MA"
    And I want to go to "1 Fleetcenter Place, Boston, MA"
    When I get driving directions
    Then I should get a list of possible routes
    And the first route should have a "distance"
    And the first route should have "travel_time"
    And the first route should have a list of "steps"

  Scenario: Invalid Destination
    Given I'm starting at "4 Yawkey Way, Boston, MA"
    And I want to go to "Foobar"
    When I get driving directions
    Then I should get "1" routing error

  Scenario: Invalid Origin
    Given I'm starting at "Foobar"
    And I want to go to "1 Fleetcenter Place, Boston, MA"
    When I get driving directions
    Then I should get "1" routing error

