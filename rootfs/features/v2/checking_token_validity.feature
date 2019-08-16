Feature: Checking Token Validity
  In order to make sure that I'm able to use the API, I want to be able to
  check my authentication token.

  Scenario: My token is valid
    Given I have valid authentication information
    When I GET /v2/ with authentication
    Then the response status is 200
    And the JSON body in the response is as follows:
    """
    {}
    """

    @failure
  Scenario: I don't provide a token
    When I GET /v2/ without authentication
    Then the response status is 401
    And the JSON body in the response is as follows:
    """
    {
      "detail" : "Authentication credentials were not provided."
    }
    """

    @failure
  Scenario: My token is not valid
    Given I have invalid authentication information
    When I GET /v2/ with authentication
    Then the response status is 401
    And the JSON body in the response is as follows:
    """
    {
      "detail" : "Invalid token."
    }
    """

