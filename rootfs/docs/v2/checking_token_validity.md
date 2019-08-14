# Checking Token Validity #

Authentication information is passed to this API by passing one's API token via the `Authorization` request header as follows:

```
Authorization: token THE_ACTUAL_TOKEN
```

One may check the validity of one's token by performing an authenticated `GET` request against the `/v2/` endpoint. A good response means the token is good, while a bad response indicates an issue with the token.

## URI ##

`/v2/`

## Method(s) ##

`GET`

## Authentication ##

Required

## Data Params ##

None

## Success Response ##

A successful response indicates that the provided token is valid, but yields no other information.

### Code ###

`200`

### Content Type ###

`application/json`

### Content ###
```json
{}
```

## Error Responses ##

The error scenarios for this endpoint are either that an invalid token was provided or no token was provided. In either case, this is indicative of a problem with the token.

### No Token Provided ###

When no token is provided, the request is unauthorized and includes a message reflecting the lacking authentication credentials.

#### Code ####

`401`

#### Content Type ####

`application/json`

#### Content ####

```json
{"detail":"Authentication credentials were not provided."}
```

### Invalid Token Provided ###

When an invalid token is provided, the request is unauthorized and includes a message reflecting the bad authentication credentials.

#### Code ####

`401`

#### Content Type ####

`application/json`

#### Content ####

```json
{"detail":"Invalid token."}
```

## Sample Calls ##

```
curl -H 'Authorization: token a1b2c3d4e5f6' http://example.com/v2/
```
