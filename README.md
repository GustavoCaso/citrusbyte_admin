## Citrusbyte Admin

Prototyping exercise.

Stack use `Ruby`, `Sinatra` as the framework and `Sequel` as the `ORM`.

The stack decided to be minimal for this exercise avoiding bringing unwanted dependencies.

The current application provides an admin to control the different devices from the user. In the actual application the current we have two entities.

      DEVICES_TYPE
| Col Name  | Type    |
|-----------|---------|
|  id       | Integer |
|  name     | String  |
|  api_url  | String  |
|  api_verb | String  |
|  controls | Json    |

         DEVICES
| Col Name        | Type    |
|-----------------|---------|
|  id             | Integer |
|  device_type_id | String  |
|  name           | String  |
|  ip             | String  |
|  dat            | Json    |

For both of the entities are provided CRUD functionality allowing the user to interact with them.
There is another entity Control but for the sake of the exercise has no CRUD functionality nor DB representation.
Been a prototype exercise there a couple of left that been a production application must have been tackle VALIDATION of data, and displaying of errors in the forms across the application. TESTING is missing as well, I would like to emphasize that no code should be without test, is not a good practice, for the life of the application or for the future developers that could inherit the project.

A part from the Admin there is an API that expose endpoint from fetching all the registered devices

`GET /api/v1/devices`     -> Return an array of devices in the system

`GET /api/v1/devices/:id` -> Return just one device

`PUT /api/v1/devices/:id` -> Update device with information form the different clients

In the current implementation there are a couple of good practices that has been omitted, like handling errors, validation of incoming data, status code. All of this should be added when providing with the real application to the client.
