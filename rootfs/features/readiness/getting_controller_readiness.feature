Feature: Getting Controller Readiness
  So as to determine if my cluster's controller is ready for my requests,
  I want to be able to query its readiness.

  Background:
    Given I have no authentication information

  Scenario: Inquiring via GET
    When I perform a GET request for /readiness
    Then the response status is 200
    And the HTML body in the response is "OK"

  Scenario: Inquiring via HEAD
    When I perform a HEAD request for /readiness
    Then the response status is 200
    And the HTML body in the response is "OK"

    @failure
  Scenario Outline: Any other HTTP verb is disallowed
    When I perform a <HTTP Verb> request for /readiness
    Then the response status is 405

    Examples:
      | HTTP Verb |
      | POST      |
      | PUT       |
      | PATCH     |
      | DELETE    |

