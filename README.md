NodeJS Restify User API
--

__Description__

This boilerplate User API comes outfitted with JSON Web Token authorization,
registration, model validation, and request parameter validation.

__Database__

The chosen database is MongoDB, a NoSQL database. Using MongoDB as a database will
not always achieve optimal performance, but it facilitates prototyping in a
beginning stage project, making it a natural choice for this boilerplate.

__Testing__

There is a Dockerfile and docker-compose.yaml that pair with `run-tests.sh`.
This tester script will spin up a MongoDB container alongside the application and
run the test suite.

__Passwords__

Passwords are effectively thrown out upon registration and the hash of the password
is stored.  Hashing is done using `bcrypt`. To authorize a user, we perform a hash compare and
return an authorization token for API usage.

__Authorization__

User authorization is done using JSON Web Tokens (jwt / rjwt).  A JSON Web Token is an
encoding of a payload identifying the user (in our case, an object containing the username),
the time the token was created, and the time the token expires.  To authorize API Requests,
the caller must include `Bearer [Token]` or `Jwt [Token]` (no square brackets) as the value
for a header keyed with `Authorization`.  If the token is not valid or not provided,
then the request will be rejected.  The only endpoints that are excluded from JWT authorization
are the `register` and `auth` endpoints.


__Environment Variables (Required)__

`MONGO_USERNAME` - The username that will be used to initialize and access the MongoDB container.

`MONGO_PASSWORD` - The password that will be used to initialize and access the MongoDB container.

`MONGO_DATABASE` - The database that will be used to initialize and access the MongoDB container.

`JWT_SECRET` - The secret string that will be used to encrypt / decrypt the json web tokens.
