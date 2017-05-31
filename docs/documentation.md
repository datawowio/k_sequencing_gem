## Usage
### Operations about Images
#### Image moderation can set 4 kinds of answer
* [Closed questions](#closed-questions)- Answer can be only approved, declined or ban.
* [Choices](#choices) - User can set multiple choices for select. It can be radio or checkbox.
* [Photo tags](#photo-tags) - User can create box-like overlays on top of your image and assign messages to each box.
* [Messages](#messages) - User can set messages for answer.
---
#### Closed questions
Create images
```ruby
KSequencing.client.create_image_closed_questions()
```
| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :-----:| :-----|
| token     | 	string | Yes |Project Authorization Token|
| data     | 	string | Yes |Data for moderate|
| postback_url	     | string      |   Yes | Image postback url|
| postback_method     | 	string | No |Postback method|
| custom_id	     | string      |   No |Custom's id|

Sample request

curl -X POST --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' --header 'Authorization: 9UPmGGWEwBsJrVnw6844tfpd' -d 'data=image&postback_url=www.example.com' 'http://k-sequencing.datawow.io/api/images/closed_questions'

Sample results
```json
{
  "data": {
    "id": {
      "$oid": "58c7a9f412c09f1c0fa78390"
    },
    "answer": null,
    "credit_charged": 0,
    "custom_id": null,
    "data": "image",
    "deadline_at": "2017-03-14T08:29:40.697+00:00",
    "postback_url": "www.example.com",
    "process": false,
    "processed_at": null,
    "project_id": null,
    "staff_id": null,
    "created_at": "2017-03-14T08:29:40.696Z",
    "updated_at": "2017-03-14T08:29:40.696Z"
  },
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```
---
#### Choices
Create new choices
```ruby
KSequencing.client.create_choices()
```
| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :-----:| :-----|
| token     | 	string | Yes |Project Authorization Token|
| instruction	     | string      |   Yes | Image instruction|
|categories | Array[string]     |    Yes | Categories of answers |
| data     | 	string | Yes |Data for attachment|
| postback_url	     | string      |   Yes | Image instruction|
|multiple | boolean   |    No | true for checkboxes and false for radio |
| postback_method     | 	string | No |Postback method|
| custom_id	     | string      |   No |Custom's id|

Sample request

curl -X POST --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' --header 'Authorization: 9UPmGGWEwBsJrVnw6844tfpd' -d 'instruction=test&categories=test&data=test&postback_url=www.example.com' 'http://k-sequencing.datawow.io/api/images/choices'

Sample results
```json
{
  "data": {
    "id": {
      "$oid": "58c8c39012c09f1c0fa78391"
    },
    "answer": null,
    "credit_charged": 0,
    "custom_id": null,
    "data": "Test data",
    "deadline_at": "2017-03-15T04:31:12.601+00:00",
    "postback_url": "www.example.com",
    "process": false,
    "instruction": "Testing",
    "categories": [
      "option1",
      "option2",
      "option3"
    ],
    "project_id": null,
    "multiple": false,
    "processed_at": null,
    "staff_id": null,
    "created_at": "2017-03-15T04:31:12.600Z",
    "updated_at": "2017-03-15T04:31:12.600Z"
  },
  "meta": {
    "code": 200,
    "message": "success"
  }
}

```
---
#### Messages
Create new message
```ruby
KSequencing.client.create_messages()
```
| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :-----:| :-----|
| token     | 	string | Yes |Project Authorization Token|
| instruction	     | string      |   Yes | Image instruction|
| data     | 	string | Yes |Data for attachment|
| postback_url	     | string      |   Yes | Image postback url|
| postback_method     | 	string | No |Postback method|
| custom_id	     | string      |   No |Custom's id|

Sample request

curl -X POST --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' --header 'Authorization: 9UPmGGWEwBsJrVnw6844tfpd' -d 'instruction=test&data=test&postback_url=www.example.com' 'http://k-sequencing.datawow.io/api/images/messages'

Sample results
```json
{
  "data": {
    "id": {
      "$oid": "58c8c3ef12c09f1c0fa78392"
    },
    "answer": null,
    "credit_charged": 0,
    "custom_id": null,
    "data": "test data",
    "deadline_at": "2017-03-15T04:32:47.763+00:00",
    "postback_url": "www.example.com",
    "process": false,
    "instruction": "Testing",
    "project_id": null,
    "processed_at": null,
    "staff_id": null,
    "created_at": "2017-03-15T04:32:47.762Z",
    "updated_at": "2017-03-15T04:32:47.762Z"
  },
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```
---
#### Photo tags
Create new photo tag
```ruby
KSequencing.client.create_photo_tags()
```
| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :-----:| :-----|
| token     | 	string | Yes |Project Authorization Token|
| instruction	     | string      |   Yes | Image instruction|
| tags	     | Array[string]      |   Yes | Tags of answers|
| data     | 	string | Yes |Data for attachment|
| postback_url	     | string      |   Yes | Image postback url|
| postback_method     | 	string | No |Postback method|
| custom_id	     | string      |   No |Custom's id|

Sample request

```
curl --request POST -H "Content-Type: application/x-www-form-urlencoded" -H "Accept: application/json" --H "Authorization: 9UPmGGWEwBsJrVnw6844tfpd" --data "instruction=test&data=test&postback_url=www.example.com" "http://k-sequencing.datawow.io/api/images/photo_tags"
```

Sample results
```json
{
  "data": {
    "id": {
      "$oid": "58c8c45c12c09f1c0fa78394"
    },
    "answer": null,
    "credit_charged": 0,
    "custom_id": null,
    "data": "test-data",
    "deadline_at": "2017-03-15T04:34:36.231+00:00",
    "postback_url": "www.example.com",
    "process": false,
    "instruction": "Testing data",
    "tags": [
      "tag1",
      "tag2",
      "tag3"
    ],
    "project_id": null,
    "processed_at": null,
    "staff_id": null,
    "created_at": "2017-03-15T04:34:36.230Z",
    "updated_at": "2017-03-15T04:34:36.230Z"
  },
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```
---
