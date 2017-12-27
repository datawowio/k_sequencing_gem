## Usage
### Operations about Images
#### Image moderation can set 5 kinds of answer
* [Closed questions](#closed-questions)(Standard Criteria (5 mins response time)) - Answer can be only approved, declined or ban(kenta).
* [Choices](#choices)(Yes or No Question from Image (30 mins response time)) - This model use to ask question with multiple choice. Anwser can be one or multiple.
* [Photo tags](#photo-tags)(Tag an object in the image (60 mins response time)) - This model use to create a selection area to find where answer is by drag the area on image from web page.
* [Messages](#messages)(Message Question from Image (30 mins response time)) - This model allow moderator type the anwser on what they see.
* [Prediction](#prediction)(Images (AI Beta / 95% accuracy)) - Use AI to prediction the result
---
### Closed questions
[Standard Criteria (5 mins response time)]

#### Create Image Standard Criteria (5 mins response time)
Closed questions - Answer can be only approved, declined or ban(kenta).

```ruby
KSequencing.image_closed_question.create()
```

| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :-----:| :-----|
| token         | string     |    Yes | Project token |
| data          | 	string | Yes |Data for moderate|
| postback_url  | string      | No | Image postback url|
| postback_method | 	string | No |Postback method|
| custom_id	    | string      |   No |Custom's id|

###### Sample request
```ruby
KSequencing.image_closed_question.create({ data: "image_url" })
```

or

Override data [:token, :postback_url, :postback_method]
```ruby
KSequencing.image_closed_question.create({
  custom_id: "custom_id",
  data: "image_url",
  postback_method: "POST",
  postback_url: "https://example.com/callbacks",
  token: "[you_token]"
})
```

###### Sample response
```json
{
  "data": {
    "id": "5a40c77ffb9d7f27354c60c2",
    "answer": nil,
    "credit_charged": 0,
    "custom_id": "custom_id",
    "data": "image_url",
    "postback_url": "https://example.com/callbacks",
    "processed_at": nil,
    "project_id": "project_id",
    "status": "unprocess" 
  },
  "success": true,
  "status": 200,
  "message": "success",
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```

###### Sample postback data
```
POST "https://example.com/callbacks?answer=declined&custom_id=custom_id&image_id=5a40cfc2fb9d7f27354c62b5&task_id=5a40cfc2fb9d7f27354c62b5"
```

---
#### Get image
```ruby
KSequencing.client.find_image(id)
```

| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :----:| :-----|
| token         | string        | Yes   | Project token |
| id            | string        | Yes   | Image id or Client's image id|

Note:
 - You must choose id or custom_id for search. Not both.
 - Image data dynamic by project token.

###### Sample request

```ruby
KSequencing.client.find_image("5a40be59fb9d7f27354c5efa")
```

or

```ruby
KSequencing.client.find_image("your custom id")
```

or

```ruby
KSequencing.client.find_image("5a40be59fb9d7f27354c5efa", { token: "[you_token]" })
```

###### Sample response
<KSequencing::Response @success=true, @status=200, @message="success" @meta={"code"=>200, "message"=>"success"}, @value={}, />

 - approved
```json
{
  "data": {
    "image": {
      "id": "5a40be59fb9d7f27354c5efa",
      "answer": "approved",
      "credit_charged": 1,
      "custom_id": "custom_id",
      "data": "image_url",
      "postback_url": "postback_url",
      "processed_at": "2017-12-25T16:02:00.599+07:00",
      "project_id": "project_id",
      "status": "processed"
    }
  },
  "success": true,
  "status": 200,
  "message": "success",
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```
 - declined
```json
{
  "data": {
    "image": {
      "id": "5a40be59fb9d7f27354c5efa",
      "answer": "declined",
      "credit_charged": 1,
      "custom_id": "custom_id",
      "data": "image_url",
      "postback_url": "postback_url",
      "processed_at": "2017-12-25T16:02:00.599+07:00",
      "project_id": "project_id",
      "status": "processed"
    }
  },
  "success": true,
  "status": 200,
  "message": "success",
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```
- kenta
```json
{
  "data": {
    "image": {
      "id": "5a40be59fb9d7f27354c5efa",
      "answer": "kenta",
      "credit_charged": 1,
      "custom_id": "custom_id",
      "data": "image_url",
      "postback_url": "postback_url",
      "processed_at": "2017-12-25T16:02:00.599+07:00",
      "project_id": "project_id",
      "status": "processed"
    }
  },
  "success": true,
  "status": 200,
  "message": "success",
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```
---

#### Get list of images
```ruby
KSequencing.image_closed_question.all({ token: "[you_token]" })
```

| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :----:| :-----|
|token | string     |    Yes | Project token |
| page	     | integer       |   No | Image id|
|per_page | integer      |    No | Client's image id |\

Note: You must choose id or custom_id for search. Not both.

###### Sample request
```ruby
KSequencing.image_closed_question.all
```

or

```ruby
KSequencing.image_closed_question.all({
  page: 1,
  per_page: 20,
  token: "[you_token]"
})
```

###### Sample results
```json
{
  "data": {
    "images": [
      {
        "answer": "approved",
        "credit_charged": 1,
        "custom_id": "custom_id",
        "data": "image_url",
        "id": "5a40c77ffb9d7f27354c60c2",
        "postback_url": "https://example.com/callbacks",
        "processed_at": "2017-12-25T16:40:19.699+07:00",
        "project_id": "project_id",
        "status": "processed"
      },
      {
        "answer": "approved",
        "credit_charged": 1,
        "custom_id": "custom_id",
        "data": "image_url",
        "id": "5a40be59fb9d7f27354c5efa",
        "postback_url": "https://example.com/callbacks",
        "processed_at": "2017-12-25T16:02:00.599+07:00",
        "project_id": "project_id",
        "status": "processed"
      },
      ...
    ]
  },
  "success": true,
  "status": 200,
  "message": "success",
  "total": 3,
  "meta": {
    "code": 200,
    "current_page": 1,
    "message": "success",
    "next_page": 2,
    "prev_page": -1,
    "total_count": 3,
    "total_pages": 2
  }
}
```
---
### Choices
[Yes or No Question from Image (30 mins response time)]

#### Create new choices
```ruby
KSequencing.image_choice.create()
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

For one answer
###### Sample request
```ruby
KSequencing.image_choice.create({
  token: "[you_token]",
  instruction: "question",
  categories: "options1 options2 options3",
  data: "image_url"
})
```

###### Sample response
```json
{
  "data": {
    "id": "5a40d924eecee03cb247f0dd",
    "allow_empty": false,
    "answer": [],
    "categories": [
      "options1",
      "options2",
      "options3"
    ],
    "credit_charged": 0,
    "custom_id": "custom_id",
    "data": "image_url",
    "instruction": "question",
    "multiple": false,
    "postback_url": "https://example.com/callbacks",
    "processed_at": nil,
    "project_id": "project_id",
    "status": "unprocess"
  },
  "success": true,
  "status": 200,
  "message": "success",
   "meta": {
    "code": 200,
    "message": "success"
  }
}
```

For multiple answer
###### Sample request
```ruby
KSequencing.image_choice.create({
  token: "[you_token]",
  instruction: "question",
  categories: "options1 options2 options3",
  data: "image_url",
  multiple: true
})
```

###### Sample response
```json
{
  "data": {
    "id": "5a40d924eecee03cb247f0dd",
    "allow_empty": false,
    "answer": [],
    "categories": [
      "options1",
      "options2",
      "options3"
    ],
    "credit_charged": 0,
    "custom_id": "custom_id",
    "data": "image_url",
    "instruction": "question",
    "multiple": true,
    "postback_url": "https://example.com/callbacks",
    "processed_at": nil,
    "project_id": "project_id",
    "status": "unprocess"
  },
  "success": true,
  "status": 200,
  "message": "success",
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```

For allow empty answer
```ruby
KSequencing.image_choice.create({
  token: "[you_token]",
  instruction: "question",
  categories: "options1 options2 options3",
  data: "image_url",
  allow_empty: true
})
```

###### Sample response
```json
{
  "data": {
    "id": "5a40d924eecee03cb247f0dd",
    "allow_empty": true,
    "answer": [],
    "categories": [
      "options1",
      "options2",
      "options3"
    ],
    "credit_charged": 0,
    "custom_id": "custom_id",
    "data": "image_url",
    "instruction": "question",
    "multiple": false,
    "postback_url": "https://example.com/callbacks",
    "processed_at": nil,
    "project_id": "project_id",
    "status": "unprocess"
  },
  "success": true,
  "status": 200,
  "message": "success",
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```
---
###### Sample postback data
```
POST "https://example.com/callbacks?answer[]=options3&custom_id=custom_id&image_id=5a41b2a8fb9d7f27354c83d8&task_id=5a41b2a8fb9d7f27354c83d8"
```

---

#### Get image choice
```ruby
KSequencing.client.find_image(id)
```

| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :----:| :-----|
| token         | string        | Yes   | Project token |
| id            | string        | Yes   | Image id or Client's image id|

Note:
 - You must choose id or custom_id for search. Not both.
 - Image data dynamic by project token.

###### Sample request

```ruby
KSequencing.client.find_image("5a40be59fb9d7f27354c5efa")
```

or

```ruby
KSequencing.client.find_image("your custom id")
```

or

```ruby
KSequencing.client.find_image("5a40be59fb9d7f27354c5efa", { token: "[you_token]" })
```

###### Sample response
<KSequencing::Response @success=true, @status=200, @message="success" @meta={"code"=>200, "message"=>"success"}, @value={}, />

For one answer
```json
{
  "data": {
    "image": {
      "id": "5a40de95aa05617baebfb01f",
      "allow_empty": false,
      "answer": ["options2"],
      "categories": [
        "options1",
        "options2",
        "options3"
      ],
      "credit_charged": 1,
      "custom_id": nil,
      "data": "image_url",
      "instruction": "question",
      "multiple": false,
      "postback_url": "https://example.com/callbacks",
      "processed_at": "2017-12-25T18:20:11.450+07:00",
      "project_id": "project_id",
      "status": "processed"
    }
  },
  "success": true,
  "status": 200,
  "message": "success",
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```

For multiple answer
```json
{
  "data": {
    "image": {
      "id": "5a40de95aa05617baebfb01f",
      "allow_empty": false,
      "answer": ["options2", "options3"],
      "categories": [
        "options1",
        "options2",
        "options3"
      ],
      "credit_charged": 1,
      "custom_id": nil,
      "data": "image_url",
      "instruction": "question",
      "multiple": true,
      "postback_url": "https://example.com/callbacks",
      "processed_at": "2017-12-25T18:20:11.450+07:00",
      "project_id": "project_id",
      "status": "processed"
    }
  },
  "success": true,
  "status": 200,
  "message": "success",
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```

For allow empty answer
```json
{
  "data": {
    "image": {
      "id": "5a40de95aa05617baebfb01f",
      "allow_empty": true,
      "answer": [],
      "categories": [
        "options1",
        "options2",
        "options3"
      ],
      "credit_charged": 1,
      "custom_id": nil,
      "data": "image_url",
      "instruction": "question",
      "multiple": false,
      "postback_url": "https://example.com/callbacks",
      "processed_at": "2017-12-25T18:20:11.450+07:00",
      "project_id": "project_id",
      "status": "processed"
    }
  },
  "success": true,
  "status": 200,
  "message": "success",
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```

#### Get all choices
```ruby
KSequencing.image_choice.all({ token: "[you_token]" })
```

| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :----:| :-----|
|token | string     |    Yes | Project token |
| page	     | integer       |   No | Image id|
|per_page | integer      |    No | Client's image id |\

Note: You must choose id or custom_id for search. Not both.

###### Sample request
```ruby
KSequencing.image_choice.all
```

or

```ruby
KSequencing.image_choice.all({
  page: 1,
  per_page: 20,
  token: "[you_token]"
})
```

###### Sample results
```json
{
  "data": {
    "images": [
      {
        "id": "5a40de95aa05617baebfb01f",
        "allow_empty": false,
        "answer": ["options2"],
        "categories": [
          "options1",
          "options2",
          "options3"
        ],
        "credit_charged": 1,
        "custom_id": "custom_id",
        "data": "image_url",
        "instruction": "question",
        "multiple": false,
        "postback_url": "https://example.com/callbacks",
        "processed_at": "2017-12-25T18:20:11.450+07:00",
        "project_id": "project_id",
        "status": "processed"
      },
      {
        "id": "5a40da6faa05617baebfaf3f",
        "allow_empty": false,
        "answer": ["options2"],
        "categories": [
          "options1",
          "options2",
          "options3"
        ],
        "credit_charged": 1,
        "custom_id": "custom_id",
        "data": "image_url",
        "instruction": "question",
        "multiple": false,
        "postback_url": "https://example.com/callbacks",
        "processed_at": "2017-12-25T18:20:08.853+07:00",
        "project_id": "project_id",
        "status": "processed"
      }
    ]
  },
  "success": true,
  "status": 200,
  "message": "success",
  "total": 8,
  "meta": {
    "code": 200,
    "message": "success",
    "current_page": 1,
    "next_page": 2,
    "prev_page": -1,
    "total_pages": 4,
    "total_count": 8
  }
}
```

---
### Messages
[Message Question from Image (30 mins response time)]

#### Create Message Question from Image (30 mins response time)
Messages - This model allow moderator type the anwser on what they see.

```ruby
KSequencing.image_message.create()
```
| Field           | Type        | Required | Description |
| -------------   |:-----------:| :-----:| :-----|
| instruction	    | string      |   Yes | Image instruction|
| data            | 	string    | Yes   | Data for attachment|
| postback_url	  | string      | No    | Image postback url|
| postback_method | 	string    | No    | Postback method|
| custom_id	      | string      |   No  | Custom's id|

###### Sample request
```ruby
KSequencing.image_message.create({
  instruction: "question",
  data: "image_url"
})
```

###### Sample response
```json
{
  "data": {
    "id": "5a41b2a8fb9d7f27354c83d8",
    "allow_empty": false,
    "answer": [],
    "categories": [
      "options1",
      "options2",
      "options3"
    ],
    "credit_charged": 0,
    "custom_id": "custom_id",
    "data": "image_url",
    "instruction": "Your question?",
    "multiple": false,
    "postback_url": "https://example.com/callbacks",
    "processed_at": nil,
    "project_id": "project_id",
    "status": "unprocess"
  },
  "success": true,
  "status": 200,
  "message": "success",
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```

###### Sample postback data
```
POST "https://example.com/callbacks?answer=sky%20blue&custom_id=custom_id&image_id=5a41b2a8fb9d7f27354c83d8&task_id=5a41b2a8fb9d7f27354c83d8"
```
---

#### Get image
```ruby
KSequencing.client.find_image(id)
```

| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :----:| :-----|
| token         | string        | Yes   | Project token |
| id            | string        | Yes   | Image id or Client's image id|

Note:
 - You must choose id or custom_id for search. Not both.
 - Image data dynamic by project token.

###### Sample request

```ruby
KSequencing.client.find_image("5a40be59fb9d7f27354c5efa")
```

or

```ruby
KSequencing.client.find_image("your custom id")
```

or

```ruby
KSequencing.client.find_image("5a41b7b2fb9d7f27354c84d4", { token: "[you_token]" })
```

###### Sample response
<KSequencing::Response @success=true, @status=200, @message="success" @meta={"code"=>200, "message"=>"success"}, @value={}, />

```json
{
  "data": {
    "image": {
      "id": "5a41b7b2fb9d7f27354c84d4",
      "answer": "sky blue",
      "credit_charged": 1,
      "custom_id": "custom_id",
      "data": "image_url",
      "instruction": "Your question?",
      "postback_url": "https://example.com/callbacks",
      "processed_at": "2017-12-26T09:45:29.328+07:00",
      "project_id": "project_id",
      "status": "processed"
    }
  },
  "success": true,
  "status": 200,
  "message": "success",
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```
---
#### Get list of image messages
```ruby
KSequencing.image_message.all({ token: "[you_token]" })
```

| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :----:| :-----|
|token | string     |    Yes | Project token |
| page	     | integer       |   No | Image id|
|per_page | integer      |    No | Client's image id |\

Note: You must choose id or custom_id for search. Not both.

###### Sample request
```ruby
KSequencing.image_message.all
```

or

```ruby
KSequencing.image_message.all({
  page: 1,
  per_page: 20,
  token: "[you_token]"
})
```

###### Sample results
```json
{
  "data": {
    "images": [
      {
        "answer": "sky blue",
        "credit_charged": 1,
        "custom_id": "custom_id",
        "data": "image_url",
        "instruction": "Your question?",
        "id": "5a41b7b2fb9d7f27354c84d4",
        "postback_url": "https://example.com/callbacks",
        "processed_at": "2017-12-25T16:40:19.699+07:00",
        "project_id": "project_id",
        "status": "processed"
      },
      {
        "answer": "yes",
        "credit_charged": 1,
        "custom_id": "custom_id",
        "data": "image_url",
        "instruction": "Your question?",
        "id": "5a40be59fb9d7f27354c5efa",
        "postback_url": "https://example.com/callbacks",
        "processed_at": "2017-12-25T16:02:00.599+07:00",
        "project_id": "project_id",
        "status": "processed"
      },
      ...
    ]
  },
  "success": true,
  "status": 200,
  "message": "success",
  "total": 3,
  "meta": {
    "code": 200,
    "current_page": 1,
    "message": "success",
    "next_page": 2,
    "prev_page": -1,
    "total_count": 3,
    "total_pages": 2
  }
}
```
---

### Photo tags
[Tag an object in the image (60 mins response time)]

#### Create new photo tag
```ruby
KSequencing.image_photo_tag.create()
```
| Field           | Type   | Required | Description |
| -------------   |:------:| :-----:| :-----|
| instruction	    | string | Yes  | Image instruction|
| data            | string | Yes  | Data for attachment|
| postback_url	  | string | No   | Image postback url|
| postback_method | string | No   | Postback method|
| custom_id	      | string | No   | Custom's id|

###### Sample request
```ruby
KSequencing.image_photo_tag.create(
  instruction: "question",
  data: "image_url"
)
```

or

Override data [:token, :postback_url, :postback_method]
```ruby
KSequencing.image_photo_tag.create({
  custom_id: "custom_id",
  data: "image_url",
  postback_method: "POST",
  postback_url: "https://example.com/callbacks",
  token: "[you_token]"
})
```

###### Sample response
```json
{
  "data": {
    "id": "5a41bc09aa05617baa2832f8",
    "answer": [],
    "credit_charged": 0,
    "custom_id": "custom_id",
    "data": "image_url",
    "instruction": "Your question?",
    "postback_url": "https://example.com/callbacks",
    "processed_at": nil,
    "project_id": "project_id",
    "status": "unprocess"
  },
  "success": true,
  "status": 200,
  "message": "success",
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```

###### Sample postback data

Case one answer
```
POST "https://example.com/callbacks?answer[0][id]=0&answer[0][x]=331&answer[0][y]=435&answer[0][z]=100&answer[0][width]=167&answer[0][height]=60&custom_id=custom_id&image_id=5a41bd55aa05617baa283338&task_id=5a41bd55aa05617baa283338"
```

Case multi answers
```
POST "https://example.com/callbacks?answer[0][id]=0&answer[0][x]=104&answer[0][y]=294&answer[0][z]=0&answer[0][width]=240&answer[0][height]=131&answer[1][id]=1&answer[1][x]=85&answer[1][y]=64&answer[1][z]=100&answer[1][width]=234&answer[1][height]=180&custom_id=&image_id=5a41bc09aa05617baa2832f8&task_id=5a41bc09aa05617baa2832f8"
```
---
#### Get image
```ruby
KSequencing.client.find_image(id)
```

| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :----:| :-----|
| token         | string        | Yes   | Project token |
| id            | string        | Yes   | Image id or Client's image id|

Note:
 - You must choose id or custom_id for search. Not both.
 - Image data dynamic by project token.

###### Sample request

```ruby
KSequencing.client.find_image("5a41bd55aa05617baa283338")
```

or

```ruby
KSequencing.client.find_image("your custom id")
```

or

```ruby
KSequencing.client.find_image("5a41bc09aa05617baa2832f8", { token: "[you_token]" })
```

###### Sample response
<KSequencing::Response @success=true, @status=200, @message="success" @meta={"code"=>200, "message"=>"success"}, @value={}, />

 - one answer
```json
{
  "data": {
    "image": {
      "id": "5a41bd55aa05617baa283338",
      "answer": [
        {
          "height": "60",
          "id": "0",
          "width": "167",
          "x": "331",
          "y": "435",
          "z": "100"
        }
      ],
      "credit_charged": 0,
      "custom_id": "custom_id",
      "data": "image_url",
      "instruction": "Your question?",
      "postback_url": "https://example.com/callbacks",
      "processed_at": "2017-12-26T10:09:28.467+07:00",
      "project_id": "project_id",
      "status": "processed"
    }
  },
  "success": true,
  "status": 200,
  "message": "success",
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```

 - two answer
```json
{
  "data": {
    "image": {
      "id": "5a41bc09aa05617baa2832f8",
      "answer": [
        {
          "height": "131",
          "id": "0",
          "width": "240",
          "x": "104",
          "y": "294",
          "z": "0"
        },
        {
          "height": "180",
          "id": "1",
          "width": "234",
          "x": "85",
          "y": "64",
          "z": "100"
        }
      ],
      "credit_charged": 0,
      "custom_id": "custom_id",
      "data": "image_url",
      "instruction": "Your question?",
      "postback_url": "https://example.com/callbacks",
      "processed_at": "2017-12-26T10:05:53.633+07:00",
      "project_id": "project_id",
      "status": "processed"
    }
  },
  "success": true,
  "status": 200,
  "message": "success",
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```
---
#### Get list of image photo tags
```ruby
KSequencing.image_photo_tag.all({ token: "[you_token]" })
```

| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :----:| :-----|
|token | string     |    Yes | Project token |
| page	     | integer       |   No | Image id|
|per_page | integer      |    No | Client's image id |\

Note: You must choose id or custom_id for search. Not both.

###### Sample request
```ruby
KSequencing.image_photo_tag.all
```

or

```ruby
KSequencing.image_photo_tag.all({
  page: 1,
  per_page: 20,
  token: "[you_token]"
})
```

###### Sample results
```json
{
  "data": {
    "images": [
      {
        "id": "5a41bd55aa05617baa283338",
        "answer": [
          {
            "height": "60",
            "id": "0",
            "width": "167",
            "x": "331",
            "y": "435",
            "z": "100"
          }
        ],
        "credit_charged": 0,
        "custom_id": "custom_id",
        "data": "image_url",
        "instruction": "Your question?",
        "postback_url": "https://example.com/callbacks",
        "processed_at": "2017-12-26T10:09:28.467+07:00",
        "project_id": "project_id",
        "status": "processed"
      },
      {
        "id": "5a41bc09aa05617baa2832f8",
        "answer": [
          {
            "height": "131",
            "id": "0",
            "width": "240",
            "x": "104",
            "y": "294",
            "z": "0"
          },
          {
            "height": "180",
            "id": "1",
            "width": "234",
            "x": "85",
            "y": "64",
            "z": "100"
          }
        ],
        "credit_charged": 0,
        "custom_id": "custom_id",
        "data": "image_url",
        "instruction": "Your question?",
        "postback_url": "https://example.com/callbacks",
        "processed_at": "2017-12-26T10:05:53.633+07:00",
        "project_id": "project_id",
        "status": "processed"
      }
    ]
  },
  "success": true,
  "status": 200,
  "message": "success",
  "total": 3,
  "meta": {
    "code": 200,
    "message": "success",
    "current_page": 1,
    "next_page": -1,
    "prev_page": -1,
    "total_pages": 1,
    "total_count": 3
  }
}
```
---

### Prediction
Images (AI Beta / 95% accuracy)
 - [nanameue]Standard Criteria (~1 min)
 - [sexual]Nudity/Sexual (~1 min)
 - [demographic]Demographic (~3 mins)
 - [ai_human]Standard Criteria & Human

#### Create prediction
Dynamic from your project key

```ruby
KSequencing.prediction.create()
```
| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :-----:| :-----|
| data            | string | Yes | Data for attachment|
| postback_url	  | string | No  | Image postback url|
| postback_method | string | No  | Postback method|
| custom_id	      | string | No  | Custom's id|

###### Sample request
```ruby
KSequencing.prediction.create(
  token: "[your_token]",
  data: "image_url"
)
```

 - [nanameue]Standard Criteria (~1 min)
###### Sample response
```json
{
  "data": {
    "id": "5a41c388aa05617baa283457",
    "answer": nil,
    "credit_charged": 0,
    "custom_id": "custom_id",
    "data": "image_url",
    "postback_url": "https://example.com/callbacks",
    "processed_at": nil,
    "project_id": "project_id",
    "status": "processing"
  },
  "success": true,
  "status": 200,
  "message": "success",
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```

###### Sample postback data
```
POST "https://example.com/callbacks?answer=approved&custom_id=&image_id=5a41c388aa05617baa283457&task_id=5a41c388aa05617baa283457"
```
---
- [sexual]Nudity/Sexual (~1 min)
###### Sample response
```json
{
  "data": {
    "id": "5a41ce6eaa05617baa2836aa",
    "answer": nil,
    "credit_charged": 0,
    "custom_id": "custom_id",
    "data": "image_url",
    "postback_url": "https://example.com/callbacks",
    "processed_at": nil,
    "project_id": "project_id",
    "status": "processing"
  },
  "success": true,
  "status": 200,
  "message": "success",
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```

###### Sample postback data
```
POST "https://example.com/callbacks?answer[0][id]=0&answer[0][x]=331&answer[0][y]=435&answer[0][z]=100&answer[0][width]=167&answer[0][height]=60&custom_id=&image_id=5a41bd55aa05617baa283338&task_id=5a41bd55aa05617baa283338"
```
---
- [demographic]Demographic (~3 mins)
###### Sample response
```json
{
  "data": {
    "id": "5a41d011fb9d7f273a75a62d",
    "answer": nil,
    "credit_charged": 0,
    "custom_id": "custom_id",
    "data": "image_url",
    "postback_url": "https://example.com/callbacks",
    "processed_at": nil,
    "project_id": "project_id",
    "status": "processing"
  },
  "success": true,
  "status": 200,
  "message": "success",
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```

###### Sample postback data
```
POST "https://example.com/callbacks?answer[result][][gender]=male&answer[result][][coordinates][x_max]=747.9999554157257&answer[result][][coordinates][x_min]=0.0&answer[result][][coordinates][y_max]=573.0054758787155&answer[result][][coordinates][y_min]=0.0&custom_id=custom_id&image_id=5a41d011fb9d7f273a75a62d&task_id=5a41d011fb9d7f273a75a62d"
```
---
- [ai_human]Standard Criteria & Human
###### Sample response
```json
{
  "data": {
    "id": "5a41d10efb9d7f27354c8963",
    "answer": nil,
    "credit_charged": 0,
    "custom_id": "custom_id",
    "data": "image_url",
    "postback_url": "https://example.com/callbacks",
    "processed_at": nil,
    "project_id": "project_id",
    "status": "processing"
  },
  "success": true,
  "status": 200,
  "message": "success",
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```

###### Sample postback data
```
POST "https://example.com/callbacks?answer=approved&custom_id=custom_id&image_id=5a41d110aa05617baebfd46f&task_id=5a41d110aa05617baebfd46f"
```
---

#### Get prediction
```ruby
KSequencing.client.find_image(id)
```

| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :----:| :-----|
| token         | string        | Yes   | Project token |
| id            | string        | Yes   | Image id or Client's image id|

Note:
 - You must choose id or custom_id for search. Not both.
 - Image data dynamic by project token.

###### Sample request

```ruby
KSequencing.client.find_image("5a40be59fb9d7f27354c5efa")
```

or

```ruby
KSequencing.client.find_image("your custom id")
```

or

```ruby
KSequencing.client.find_image("5a40be59fb9d7f27354c5efa", { token: "[you_token]" })
```

- [nanameue]Standard Criteria (~1 min)
###### Sample response
```json
{
  "data": {
    "image": {
      "id": "5a40a134fb9d7f273a7574d1",
      "answer": "approved",
      "credit_charged": 1,
      "custom_id": "custom_id",
      "data": "image_url",
      "postback_url": "https://example.com/callbacks",
      "processed_at": "2017-12-25T13:56:54.651+07:00",
      "project_id": "project_id",
      "status": "processed"
    }
  },
  "success": true,
  "status": 200,
  "message": "success",
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```
---
- [sexual]Nudity/Sexual (~1 min)
###### Sample response
```json
{
  "data": {
    "image": {
      "id": "5a40a2a6aa05617baa2805c0",
      "answer": {
        "sexual": 0.030112840235233307
      },
      "credit_charged": 0,
      "custom_id": "custom_id",
      "data": "image_url",
      "postback_url": "https://example.com/callbacks",
      "processed_at": "2017-12-25T14:03:05.750+07:00",
      "project_id": "project_id",
      "status": "processed"
    }
  },
  "success": true,
  "status": 200,
  "message": "success",
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```
---
- [demographic]Demographic (~3 mins)
###### Sample response
```json
{
  "data": {
    "image": {
      "id": "5a41d011fb9d7f273a75a62d",
      "answer": {
        "result": [
          {
            "coordinates": {
              "x_max": 747.9999554157257,
              "x_min": 0.0,
              "y_max": 573.0054758787155,
              "y_min": 0.0
            },
            "gender": "male"
          }
        ]
      },
      "credit_charged": 0,
      "custom_id": "custom_id",
      "data": "image_url",
      "postback_url": "https://example.com/callbacks",
      "processed_at": "2017-12-26T11:29:20.212+07:00",
      "project_id": "project_id",
      "status": "processed"
    }
  },
  "success": true,
  "status": 200,
  "message": "success",
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```
---
- [ai_human]Standard Criteria & Human
###### Sample response
```json
{
  "data": {
    "image": {
      "id": "5a41d110aa05617baebfd46f",
      "answer": "approved",
      "credit_charged": 1,
      "custom_id": "custom_id",
      "data": "image_url",
      "postback_url": "https://example.com/callbacks",
      "processed_at": "2017-12-26T11:34:55.786+07:00",
      "project_id": "project_id",
      "status": "processed"
    }
  },
  "success": true,
  "status": 200,
  "message": "success",
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```
if prediction [ai_human] processed by human you will find answer human from Get list of predictions
###### example
```json
{
  "data": {
    "images": [
      {
        "id": "5a41d10efb9d7f27354c8963",
        "answer": "human",
        "credit_charged": 0,
        "custom_id": nil,
        "data": "image_url",
        "postback_url": "https://example.com/callbacks",
        "processed_at": "2017-12-26T11:33:20.009+07:00",
        "project_id": "project_id",
        "status": "processed"
      },
      {
        "id": "5a40a178fb9d7f27354c58bc",
        "answer": "approved",
        "credit_charged": 0,
        "custom_id": nil,
        "data": "image_url",
        "postback_url": "https://example.com/callbacks",
        "processed_at": "2017-12-25T13:58:03.022+07:00",
        "project_id": "project_id",
        "status": "processed"
      }
    ]
  },
  "success": true,
  "status": 200,
  "message": "success",
  "total": 2,
  "meta": {
    "code": 200,
    "message": "success",
    "current_page": 1,
    "next_page": -1,
    "prev_page": -1,
    "total_pages": 1,
    "total_count": 2
  }
}
```
