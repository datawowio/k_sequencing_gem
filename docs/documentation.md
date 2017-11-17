## Usage
### Operations about Images
#### Image moderation can set 4 kinds of answer
* [Closed questions](#closed-questions)- Answer can be only approved, declined or ban.
* [Choices](#choices) - User can set multiple choices for select. It can be radio or checkbox.
* [Photo tags](#photo-tags) - User can create box-like overlays on top of your image and assign messages to each box.
* [Messages](#messages) - User can set messages for answer.
* [Prediction](#prediction) - Use AI to prediction the result
---
### Closed questions
Get image
```ruby
KSequencing.image_closed_question.find_by()
```

| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :----:| :-----|
| id	     | string      |   No | Image id|
| custom_id | string     |    No | Client's image id |

Note: You must choose id or custom_id for search. Not both.

Sample request
```ruby
KSequencing.image_closed_question.find_by({
  token: "[you_token]",
  id: "59311194e99991b2ca8979f1"
})
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
KSequencing.image_closed_questions.create()
```
| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :-----:| :-----|
| data     | 	string | Yes |Data for moderate|
| postback_url	     | string      | No | Image postback url|
| postback_method     | 	string | No |Postback method|
| custom_id	     | string      |   No |Custom's id|

Sample request
```ruby
KSequencing.image_closed_questions.create({
  token: "[you_token]",
  data: "image_url"
})
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
KSequencing.image_choice.find_by()
```

| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :----:| :-----|
| id	     | string  |   No | Image id|
|custom_id | string |    No | Client's image id |

Note: You must choose id or custom_id for search. Not both.

Sample request
```ruby
KSequencing.image_choice.find_by({
  token: "[you_token]",
  id: "59311194e99991b2ca8979f1"
})
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
KSequencing.image_choices.create()
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
| allow_empty	     | boolean      |   No |Allow sent answer with empty choice. default is `false`|
 

Note: Answer can choose only one is default. If you want answer to be multiple, you need to set multiple to true.

Sample request

For one answer
```ruby
KSequencing.image_choices.create({
  token: "[you_token]",
  instruction: "question",
  categories: "options1 options2 options3",
  data: "image_url"
})
```
For multiple answer
```ruby
KSequencing.image_choices.create({
  token: "[you_token]",
  instruction: "question",
  categories: "options1 options2 options3",
  data: "image_url",
  multiple: true
})
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
KSequencing.image_message.find_by()
```

| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :----:| :-----|
| id	     | string      |   No | Image id|
|custom_id | string     |    No | Client's image id |

Note: You must choose id or custom_id for search. Not both.

Sample request
```ruby
KSequencing.image_message.find_by({
  token: "[you_token]",
  id: "592fbfce1b9d8f69e4178688"
})
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
KSequencing.image_messages.create()
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
KSequencing.image_messages.create({
  instruction: "question",
  data: "image_url"
})
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
KSequencing.image_photo_tag.find_by()
```

| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :----:| :-----|
| id	     | string      |   No | Image id|
|custom_id | string     |    No | Client's image id |

Note: You must choose id or custom_id for search. Not both.

Sample request
```ruby
KSequencing.image_photo_tag.find_by({
  id: "592fbfec1b9d8f69e4178689"
})
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
KSequencing.client.image_photo_tags.create()
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
KSequencing.client.image_photo_tags.create(
  instruction: "question",
  data: "image_url"
)
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


#### Prediction
Get prediction
```ruby
KSequencing.prediction.find_by()
```

| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :----:| :-----|
| id	     | string      |   No | Image id|
|custom_id | string     |    No | Client's image id |

Note: You must choose id or custom_id for search. Not both.

Sample request
```ruby
KSequencing.prediction.find_by({
  id: "592fbfec1b9d8f69e4178689"
})
```

Sample results
```json
{
  "data": {
    "image": {
      "id": "5a0d3a8c0deb540ab9c56e33",
      "answer": null,
      "credit_charged": 0,
      "custom_id": null,
      "data": "www.example.com",
      "postback_url": "www.example.com",
      "processed_at": null,
      "project_id": 96,
      "status": "processing"
    }
  },
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```

Create prediction
```ruby
KSequencing.prediction.create()
```
| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :-----:| :-----|
| data     | 	string | Yes |Data for attachment|
| postback_url	     | string      | No | Image postback url|
| postback_method     | 	string | No |Postback method|
| custom_id	     | string      |   No |Custom's id|

Sample request
```ruby
KSequencing.prediction.create(
  token: "[your_token]",
  data: "image_url"
)
```

Sample results
```json
{
  "data": {
    "id": "5a0e49d00deb540ab9c56e4f",
    "answer": null,
    "credit_charged": 0,
    "custom_id": null,
    "data": "www.example.com",
    "postback_url": "www.example.com",
    "processed_at": null,
    "project_id": 96,
    "status": "processing"
  },
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```
<enter>
---

As you see above all API have a same name just change model name and paramter, however if you would like to list all of your data just use all() see example below 

#### Get list of data 

```ruby
KSequencing.[model].all()
```
| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :-----:| :-----|
| page     | 	interger | No | default 0|
| per_page 	     | string      | No | default 20 |

Sample request
```ruby
KSequencing.[model].all(
  token: "[your_token]"
)
```
