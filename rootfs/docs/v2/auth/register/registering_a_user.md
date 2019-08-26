# Registering A User #

Depending on controller configuration, one may be able to self-register an account in the cluster. This is done by `POST`ing data to the `/v2/auth/register` endpoint.

## URI ##

`/v2/auth/register`

## Method(s) ##

`POST`

## Authentication ##

If registration is disabled beyond the initial admin user, authentication (and admin privileges) are required.

If registration is disabled beyond the initial admin user and there is not yet an admin user, authentication is not required.

If registration is not limited to the initial admin user, authentication is not required.

## Data Params ##

```json
{
  "username" : "me",
  "password" : "supersecret",
  "email" : "me@example.com",
  "first_name" : "Example",
  "last_name" : "User"
}
```

### Required Attributes ###

* `username` ***String***
* `email` ***String***
* `password` ***String***

### Optional Attributes ###

* `first_name` ***String***
* `last_name` ***String***

### Notes ###

* The data types for all fields are strict.
* Whitespace is removed from the beginning and end of all attributes before any further processing.
* Usernames may consist of letters, numbers, and these non-alphanumeric characters: `@.+-_`
* Usernames may not be blank (ie `""`) after whitespace trimming.
* Usernames are case-sensitive.
* Usernames must be unique.
* Passwords may not be blank (ie `""`) after whitespace trimming.
* Email must be in the form of a valid email address.

## Success Response ##

A successful response indicates that the user in question was created successfully and returns a representation of that user in the cluster.

### Code ###

`201`

### Content Type ###

`application/json`

### Content ###

```json
{
  "email" : "me@example.com",
  "username" : "me",
  "first_name" : "me",
  "last_name" : "example",
  "is_superuser" : false,
  "is_staff" : false,
  "groups" : [],
  "user_permissions" : [],
  "last_login" : "a timestamp",
  "date_joined" : "a timestamp",
  "is_active" : true
}
```

## Error Responses ##

The error scenarios for this endpoint depend somewhat on the controller configuration, but there are also a few data validation errors that may occur.

### Registration Disabled ###

When the controller is configured to not allow registration beyond the initial admin user, unauthenticated requests `/v2/auth/register` fail due to lacking authentication credentials.

#### Code ####

`403`

#### Content Type ####

`application/json`

#### Content ####

```json
{"detail":"Authentication credentials were not provided."}
```

## Non-Admin User Attempts To Create A User ##

Whether registration is opened or closed, if a non-admin attempts to register another user while authenticated, the request fails with a message regarding lacking permissions.

#### Code ####

`403`

#### Content Type ####

`application/json`

#### Content ####

```json
{"detail":"You do not have permission to perform this action."}
```


### Missing Username ###

If a username is not provided in the data payload for the request, the request fails and an error regarding the missing username is presented.

#### Code ####

`400`

#### Content Type ####

`application/json`

#### Content ####

```json
{"username":["This field is required."]}
```

### Empty Username ###

If an empty string is provided as the username in the data payload for the request, the request fails and an error regarding the blank username is presented.

#### Code ####

`400`

#### Content Type ####

`application/json`

#### Content ####

```json
{"username":["This field may not be blank."]}
```

### Invalid Username ###

A username may contain only alphanumeric characters and the following non-alphanumeric characters: `@.+-_`

If a username is provided with characters not in that set, the request fails with a message about the username format.

#### Code ####

`400`

#### Content Type ####

`application/json`

#### Content ####

```json
{"username":["Enter a valid username. This value may contain only letters, numbers, and @/./+/-/_ characters."]}
```

### Repeated Username ###

Usernames must be unique. If a user already exists, and that user's username is passed in, the request fails with an error regarding username uniqueness.

#### Code ####

`400`

#### Content Type ####

`application/json`

#### Content ####

```json
{"username":["A user with that username already exists."]}
```

### Non-string Username ###

Usernames must be strings. If a non-string username is passed in, the request fails with an error regarding username type.

#### Code ####

`400`

#### Content Type ####

`application/json`

#### Content ####

```json
{"username":["This field must be a string."]}
```

### Missing Password ###

If a password is not provided in the data payload for the request, the request fails and an error regarding the missing password is presented.

#### Code ####

`400`

#### Content Type ####

`application/json`

#### Content ####

```json
{"password":["This field is required."]}
```

### Empty Password ###

If an empty string is provided as the password in the data payload for the request, the request fails and an error regarding the blank password is presented.

#### Code ####

`400`

#### Content Type ####

`application/json`

#### Content ####

```json
{"password":["This field may not be blank."]}
```

### Non-string Password ###

Passwords must be strings. If a non-string password is passed in, the request fails with an error regarding password type.

#### Code ####

`400`

#### Content Type ####

`application/json`

#### Content ####

```json
{"password":["This field must be a string."]}
```

### Missing Email ###

If an email is not provided in the data payload for the request, the request fails and an error regarding the missing email is presented.

#### Code ####

`400`

#### Content Type ####

`application/json`

#### Content ####

```json
{"email":["This field is required."]}
```

### Invalid Email ###

The email field must include a properly-formatted email address.

#### Code ####

`400`

#### Content Type ####

`application/json`

#### Content ####

```json
{"email":["Enter a valid email address."]}
```

### Non-string Email ###

Emails must be strings. If a non-string email is passed in, the request fails with an error regarding email type.

#### Code ####

`400`

#### Content Type ####

`application/json`

#### Content ####

```json
{"email":["This field must be a string."]}
```

## Sample Calls ##

### Unauthenticated ###

```
curl -H "Content-Type: application/json" -X POST -d '{"username":"me","password":"supersecret","email":"me@example.com"}
http://example.com/v2/auth/register
```

### Authenticated ###

```
curl -H 'Authorization: token a1b2c3d4e5f6' -H "Content-Type: application/json" -X POST -d '{"username":"me","password":"supersecret","email":"me@example.com"}
http://example.com/v2/auth/register
```
