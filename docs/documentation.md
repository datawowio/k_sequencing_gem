## Usage
### Operations about Images
#### Image moderation can set 4 kinds of answer
* [Closed questions](#closed-questions)- Answer can be only approved, declined or ban.
* [Choices](#choices) - User can set multiple choices for select. It can be radio or checkbox.
* [Photo tags](#photo-tags) - User can create box-like overlays on top of your image and assign messages to each box.
* [Messages](#messages) - User can set messages for answer.
---
#### Closed questions
Get image
```ruby
KSequencing.client.get_image_closed_question()
```

| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :----:| :-----|
| id	     | string      |   No | Image id|
| custom_id | string     |    No | Client's image id |

Note: You must choose id or custom_id for search. Not both.

Sample request
```ruby
KSequencing.client.get_image_closed_question(
  id: "59311194e99991b2ca8979f1"
)
```

```
curl --request GET -H "Accept: application/json" -H "Authorization: 9UPmGGWEwBsJrVnw6844tfpd" "https://k-sequencing.datawow.io/api/images/closed_question?id=59311194e99991b2ca8979f1"
```

Sample results
```json
{
  "data": {
    "image": {
      "id": "59311194e99991b2ca8979f1",
      "answer": null,
      "credit_charged": 0,
      "custom_id": null,
      "data": "image_url",
      "postback_url": "www.example.com",
      "processed_at": null,
      "project_id": 3,
      "status": "unprocess",
      "created_at": "2017-06-02T07:19:48.574Z"
    }
  },
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```

Create images
```ruby
KSequencing.client.create_image_closed_questions()
```
| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :-----:| :-----|
| data     | 	string | Yes |Data for moderate|
| postback_url	     | string      | No | Image postback url|
| postback_method     | 	string | No |Postback method|
| custom_id	     | string      |   No |Custom's id|

Sample request
```ruby
KSequencing.client.create_image_closed_questions(
  data: "image_url"
)
```

```
curl --request POST -H "Content-Type: application/x-www-form-urlencoded" -H "Accept: application/json" -H "Authorization: 9UPmGGWEwBsJrVnw6844tfpd" --data "data=image_url" "http://k-sequencing.datawow.io/api/images/closed_questions"
```

Sample results
```json
{
  "data": {
    "id": "58c8c3ef12c09f1c0fa78392",
    "answer": null,
    "credit_charged": 0,
    "custom_id": null,
    "data": "image_url",
    "postback_url": "www.example.com",
    "process": false,
    "processed_at": null,
    "project_id": 1,
    "created_at": "2017-03-14T08:29:40.696Z"
  },
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```
---
#### Choices
Get image
```ruby
KSequencing.client.get_image_choice()
```

| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :----:| :-----|
| id	     | string  |   No | Image id|
|custom_id | string |    No | Client's image id |

Note: You must choose id or custom_id for search. Not both.

Sample request
```ruby
KSequencing.client.get_image_choice(
  id: "59311194e99991b2ca8979f1"
)
```

```
curl --request GET -H "Accept: application/json" -H "Authorization: 9UPmGGWEwBsJrVnw6844tfpd" "https://k-sequencing.datawow.io/api/images/choice?id=59311194e99991b2ca8979f1"
```

Sample results
```json
{
  "data": {
    "image": {
      "id": "59311194e99991b2ca8979f1",
      "answer": [
        "approved"
      ],
      "credit_charged": 0,
      "custom_id": null,
      "data": "image_url",
      "postback_url": "www.example.com",
      "instruction": "TEST instruction",
      "categories": [
        "approved",
        "reject"
      ],
      "project_id": 190,
      "multiple": false,
      "processed_at": "2017-06-01T07:23:17.494+00:00",
      "status": "unprocess",
      "created_at": "2017-06-01T07:18:02.350Z"
    }
  },
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```

Create new choices
```ruby
KSequencing.client.create_image_choices()
```
| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :-----:| :-----|
| instruction	     | string      |   Yes | Image instruction|
|categories | Array[string]     |    Yes | Categories of answers |
| data     | 	string | Yes |Data for attachment|
| postback_url	     | string      |  No | Image postback url|
|multiple | boolean   |    No | true for multiple answer and false for one answer |
| postback_method     | 	string | No |Postback method|
| custom_id	     | string      |   No |Custom's id|

Note: Answer can choose only one is default. If you want answer to be multiple, you need to set multiple to true.

Sample request

For one answer
```ruby
KSequencing.client.create_image_choices(
  instruction: "question",
  categories: "options1 options2 options3",
  data: "image_url"
)
```
For multiple answer
```ruby
KSequencing.client.create_image_choices(
  instruction: "question",
  categories: "options1 options2 options3",
  data: "image_url",
  multiple: true
)
```

```
curl --request POST -H "Content-Type: application/x-www-form-urlencoded" -H "Accept: application/json" -H "Authorization: 9UPmGGWEwBsJrVnw6844tfpd" --data "instruction=question&categories=option1%20options2%20options3&data=image_url" "http://k-sequencing.datawow.io/api/images/choices"
```

Sample results
```json
{
  "data": {
    "id": "58c8c3ef12c09f1c0fa78392",
    "answer": null,
    "credit_charged": 0,
    "custom_id": null,
    "data": "image_url",
    "postback_url": "www.example.com",
    "process": false,
    "instruction": "question",
    "categories": [
      "option1",
      "option2",
      "option3"
    ],
    "project_id": 1,
    "multiple": false,
    "processed_at": null,
    "created_at": "2017-03-15T04:31:12.600Z"
  },
  "meta": {
    "code": 200,
    "message": "success"
  }
}

```
---
#### Messages
Get image
```ruby
KSequencing.client.get_image_message()
```

| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :----:| :-----|
| id	     | string      |   No | Image id|
|custom_id | string     |    No | Client's image id |

Note: You must choose id or custom_id for search. Not both.

Sample request
```ruby
KSequencing.client.get_image_message(
  id: "592fbfce1b9d8f69e4178688"
)
```

```
curl --request GET -H "Accept: application/json" -H "Authorization: 9UPmGGWEwBsJrVnw6844tfpd" "https://k-sequencing.datawow.io/api/images/message?id=592fbfce1b9d8f69e4178688"
```

Sample results
```json
{
  "data": {
    "image": {
      "id": "592fbfce1b9d8f69e4178688",
      "answer": null,
      "credit_charged": 0,
      "custom_id": null,
      "data": "image_url",
      "postback_url": "www.example.com",
      "instruction": "Test",
      "project_id": 190,
      "processed_at": null,
      "status": "unprocess",
      "created_at": "2017-06-01T07:18:38.786Z"
    }
  },
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```

Create new message
```ruby
KSequencing.client.create_image_messages()
```
| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :-----:| :-----|
| instruction	     | string      |   Yes | Image instruction|
| data     | 	string | Yes |Data for attachment|
| postback_url	     | string      | No | Image postback url|
| postback_method     | 	string | No |Postback method|
| custom_id	     | string      |   No |Custom's id|

Sample request
```ruby
KSequencing.client.create_image_messages(
  instruction: "question",
  data: "image_url"
)
```

```
curl --request POST -H "Content-Type: application/x-www-form-urlencoded" -H "Accept: application/json" -H "Authorization: 9UPmGGWEwBsJrVnw6844tfpd" --data "instruction=question&data=image_url" "http://k-sequencing.datawow.io/api/images/messages"
```

Sample results
```json
{
  "data": {
    "id": "58c8c3ef12c09f1c0fa78392",
    "answer": null,
    "credit_charged": 0,
    "custom_id": null,
    "data": "image_url",
    "postback_url": "www.example.com",
    "process": false,
    "instruction": "question",
    "project_id": 1,
    "processed_at": null,
    "created_at": "2017-03-15T04:32:47.762Z"
  },
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```
---
#### Photo tags
Get image
```ruby
KSequencing.client.get_image_photo_tag()
```

| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :----:| :-----|
| id	     | string      |   No | Image id|
|custom_id | string     |    No | Client's image id |

Note: You must choose id or custom_id for search. Not both.

Sample request
```ruby
KSequencing.client.get_image_photo_tag(
  id: "592fbfec1b9d8f69e4178689"
)
```

```
curl --request GET -H "Accept: application/json" -H "Authorization: 9UPmGGWEwBsJrVnw6844tfpd" "https://k-sequencing.datawow.io/api/images/photo_tag?id=592fbfec1b9d8f69e4178689"
```

Sample results
```json
{
  "data": {
    "image": {
      "id": "592fbfec1b9d8f69e4178689",
      "answer": [],
      "credit_charged": 0,
      "custom_id": null,
      "data": "image_url",
      "postback_url": "www.example.com",
      "instruction": "TEST",
      "project_id": 190,
      "processed_at": null,
      "status": "unprocess",
      "created_at": "2017-06-01T07:19:08.587Z"
    }
  },
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```

Create new photo tag
```ruby
KSequencing.client.create_image_photo_tags()
```
| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :-----:| :-----|
| instruction	     | string      |   Yes | Image instruction|
| data     | 	string | Yes |Data for attachment|
| postback_url	     | string      | No | Image postback url|
| postback_method     | 	string | No |Postback method|
| custom_id	     | string      |   No |Custom's id|

Sample request
```ruby
KSequencing.client.create_image_photo_tags(
  instruction: "question",
  data: "image_url"
)
```

```
curl --request POST -H "Content-Type: application/x-www-form-urlencoded" -H "Accept: application/json" --H "Authorization: 9UPmGGWEwBsJrVnw6844tfpd" --data "instruction=question&data=image_url" "http://k-sequencing.datawow.io/api/images/photo_tags"
```

Sample results
```json
{
  "data": {
    "id": "58c8c3ef12c09f1c0fa78392",
    "answer": null,
    "credit_charged": 0,
    "custom_id": null,
    "data": "image_url",
    "postback_url": "www.example.com",
    "process": false,
    "instruction": "question",
    "project_id": 1,
    "processed_at": null,
    "created_at": "2017-03-15T04:34:36.230Z"
  },
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```
---
