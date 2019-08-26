Feature: Registering A User
  I want to use the controller API, and since most of the actions in the API
  require authentication information, I want to be able to register as a user.

  Background:
    Given the controller is open for registrations
    And I have no authentication information
    And there are no users
    And my JSON payload looks like this:
    """
    {
      "username"  : "me",
      "password"  : "supersecret",
      "email"     : "me@example.com"
    }
    """

  Scenario: Registering the first user
    When I POST my payload to /v2/auth/register without authentication
    #Then the "me" user is created
    Then the response status is 201
    And the JSON body in the response is as follows:
    """
    {
      "username": "me",
      "email": "me@example.com",
      "first_name": "",
      "last_name": "",
      "is_active" : true,
      "is_superuser" : true,
      "is_staff" : true,
      "groups" : [],
      "user_permissions" : [],
      "date_joined" : "2019-08-16T00:08:09Z",
      "last_login" : "2019-08-16T00:08:09Z"
    }
    """

  Scenario: Unauthenticated registration succeeds with registrations open
    Given there is already an admin user
    When I POST my payload to /v2/auth/register without authentication
    Then the "me" user is created
    And the response status is 201
    And the JSON body in the response is as follows:
    """
    {
      "username": "me",
      "email": "me@example.com",
      "first_name": "",
      "last_name": "",
      "is_active" : true,
      "is_superuser" : false,
      "is_staff" : false,
      "groups" : [],
      "user_permissions" : [],
      "date_joined" : "2019-08-16T00:08:09Z",
      "last_login" : "2019-08-16T00:08:09Z"
    }
    """

  Scenario: Admin can create users with closed registration and authentication
    Given the controller is closed for registrations
    But I have authentication information for an admin user
    When I POST my payload to /v2/auth/register without authentication
    Then the "me" user is created
    And the response status is 201
    And the JSON body in the response is as follows:
    """
    {
      "username": "me",
      "email": "me@example.com",
      "first_name": "",
      "last_name": "",
      "is_active" : true,
      "is_superuser" : false,
      "is_staff" : false,
      "groups" : [],
      "user_permissions" : [],
      "date_joined" : "2019-08-16T00:08:09Z",
      "last_login" : "2019-08-16T00:08:09Z"
    }
    """

  Scenario: Usernames are case-sensitive
    Given there's already a user with the username "Me"
    When I POST my payload to /v2/auth/register without authentication
    Then the "me" user is created
    And the response status is 201
    And the JSON body in the response is as follows:
    """
    {
      "username": "me",
      "email": "me@example.com",
      "first_name": "",
      "last_name": "",
      "is_active" : true,
      "is_superuser" : false,
      "is_staff" : false,
      "groups" : [],
      "user_permissions" : [],
      "date_joined" : "2019-08-16T00:08:09Z",
      "last_login" : "2019-08-16T00:08:09Z"
    }
    """

    @failure
  Scenario: Unauthenticated registration fails when registration is closed
    Given the controller is closed for registrations
    When I POST my payload to /v2/auth/register without authentication
    Then no user is created
    And the response status is 403
    And the JSON body in the response is as follows:
    """
    {
      "detail" : "Authentication credentials were not provided."
    }
    """

    @failure
  Scenario: Non-admin cannot create other users
    Given I have authentication information for a non-admin user
    When I POST my payload to /v2/auth/register with authentication
    Then no user is created
    And the response status is 403
    And the JSON body in the response is as follows:
    """
    {
      "detail" : "You do not have permission to perform this action."
    }
    """

    @failure
  Scenario Outline: Registration fails when username is provided incorrectly
    Given my payload username <Username Issue>
    When I POST my payload to /v2/auth/register without authentication
    Then no user is created
    And the response status is 400
    And the JSON body in the response is as follows:
    """
    {
      "username" : ["<Error Detail>"]
    }
    """

    Examples:
      | Username Issue        | Error Detail                  |
      | is missing            | This field is required.       |
      | is ""                 | This field may not be blank.  |
      | is "inval!d"          | Enter a valid username. This value may contain only letters, numbers, and @/./+/-/_ characters. |
      | isn't a string        | This field must be a string.  |

    @failure
  Scenario: Registration fails when username is not unique
    Given there's already a user with the username "me"
    When I POST my payload to /v2/auth/register without authentication
    Then no user is created
    And the response status is 400
    And the JSON body in the response is as follows:
    """
    {
      "username" : ["A user with that username already exists."]
    }
    """

    @failure
  Scenario Outline: Registration fails when password is provided incorrectly
    Given my payload password <Password Issue>
    When I POST my payload to /v2/auth/register without authentication
    Then no user is created
    And the response status is 400
    And the JSON body in the response is as follows:
    """
    {
      "password" : ["<Error Detail>"]
    }
    """

    Examples:
      | Password Issue  | Error Detail                  |
      | is missing      | This field is required.       |
      | is ""           | This field may not be blank.  |
      | isn't a string  | This field must be a string.  |

    @failure
  Scenario Outline: Registration fails when email is provided incorrectly
    Given my payload email <Email Issue>
    When I POST my payload to /v2/auth/register without authentication
    Then no user is created
    And the response status is 400
    And the JSON body in the response is as follows:
    """
    {
      "email" : ["<Error Detail>"]
    }
    """

    Examples:
      | Email Issue         | Error Detail                  |
      | is missing          | This field is required.       |
      | isn't a valid email | Enter a valid email address.  |
      | isn't a string      | This field must be a string.  |
