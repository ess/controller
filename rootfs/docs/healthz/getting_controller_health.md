# Getting Controller Health #

One may retrieve the controller's health via either a `GET` request or a `HEAD` request against the `/healthz` endpoint.

This endpoint should always return a successful response with these verbs, but any other verb is explicitly disallowed.

* **URI**

`/healthz`

* **Method(s):**

`GET`, `HEAD`

* **Authentication:**

None

* **Data Params:**

None

* **Success Response:**

  * **Code:** 200<br />
    **Content:**

    OK

* **Error Response:**

  * **Code:** 405<br />
    **Content:**

    This method is not allowed

* **Sample Calls:**

  ```
  curl http://example.com/healthz
  ```

  ```
  curl -X HEAD http://example.com/healthz
  ```
