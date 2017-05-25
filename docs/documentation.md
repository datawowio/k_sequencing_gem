## Usage
### Operations about Images
#### Image moderation can set 4 kinds of answer
* Closed question - Answer can be only approved, declined or ban.
* Choices - User can set multiple choices for select. It can be radio or checkbox.
* Photo tag - User can create box-like overlays on top of your image and assign messages to each box.
* Message - User can set messages for answer.
---
#### Closed question
Getting all image closed question
```ruby
KSequencing.client.image_closed_questions()
```

Create images
```ruby
KSequencing.client.image_closed_questions()
```
| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :-----:| :-----|
| token     | 	string | Yes |User Authorization Token|
| data     | 	string | Yes |Data for moderate|
| postback_url	     | string      |   Yes | Image postback url|
| project_id     | 	string | No |	Project id|
| postback_method     | 	string | No |Postback method|
| custom_id	     | string      |   No |Custom's id|

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
Show image
```ruby
KSequencing.client.image_closed_question(id)
```
| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :-----:| :-----|
| id     | 	integer | Yes |Id of image|
| token     | 	string | Yes |User Authorization Token|

---
#### Choices
Getting all choices
```ruby
KSequencing.client.get_choices()
```
| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :----:| :-----|
| token     | 	string | Yes |User Authorization Token|
| page	     | integer      |   No | page|
|per_page | integer     |    No | per_page |

Create new choices
```ruby
KSequencing.client.create_choices()
```
| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :-----:| :-----|
| token     | 	string | Yes |User Authorization Token|
| instruction	     | string      |   Yes | Image instruction|
|categories | Array[string]     |    Yes | Categories of answers |
| data     | 	string | Yes |Data for attachment|
| postback_url	     | string      |   Yes | Image instruction|
|multiple | boolean   |    No | true for checkboxes and false for radio |
| project_id     | 	string | No |	Project id|
| postback_method     | 	string | No |Postback method|
| custom_id	     | string      |   No |Custom's id|

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
Getting all messages
```ruby
KSequencing.client.get_messages()
```
| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :----:| :-----|
| token     | 	string | Yes |User Authorization Token|
| page	     | integer      |   No | page|
|per_page | integer     |    No | per_page |

Create new message
```ruby
KSequencing.client.create_messages()
```
| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :-----:| :-----|
| token     | 	string | Yes |User Authorization Token|
| instruction	     | string      |   Yes | Image instruction|
| data     | 	string | Yes |Data for attachment|
| postback_url	     | string      |   Yes | Image postback url|
| project_id     | 	string | No |	Project id|
| postback_method     | 	string | No |Postback method|
| custom_id	     | string      |   No |Custom's id|

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
Getting all photo tags
```ruby
KSequencing.client.get_photo_tags()
```
| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :----:| :-----|
| token     | 	string | Yes |User Authorization Token|
| page	     | integer      |   No | page|
|per_page | integer     |    No | per_page |

Create new photo tag
```ruby
KSequencing.client.create_photo_tags()
```
| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :-----:| :-----|
| token     | 	string | Yes |User Authorization Token|
| instruction	     | string      |   Yes | Image instruction|
| tags	     | Array[string]      |   Yes | Tags of answers|
| data     | 	string | Yes |Data for attachment|
| postback_url	     | string      |   Yes | Image postback url|
| project_id     | 	string | No |	Project id|
| postback_method     | 	string | No |Postback method|
| custom_id	     | string      |   No |Custom's id|

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
### Operation about reports
* Can filter date range
* Can filter only moderator that you focus

#### Closed questions
Getting all closed question reports
```ruby
KSequencing.client.image_closed_question_reports()
```
| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :----:| :-----|
| token     | 	string | Yes |User Authorization Token|
| project_id	     | integer      |   No | project id|
|staff_id | integer     |    No | moderator id |
|start_date | datetime     |    No | start date for filter |
|end_date | datetime     |    No | end date for filter |

Sample results
```json
{
  "data": {
    "total": 5,
    "processed": 5,
    "report_details": [
      {
        "_id": 20,
        "value": {
          "staff_id": 20,
          "processed": 5,
          "approved": 5,
          "declined": 0,
          "ban": 0
        }
      }
    ]
  },
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```
---
#### Choices
Getting all choice reports
```ruby
KSequencing.client.image_choice_reports()
```
| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :----:| :-----|
| token     | 	string | Yes |User Authorization Token|
| project_id	     | integer      |   No | project id|
|staff_id | integer     |    No | moderator id |
|start_date | datetime     |    No | start date for filter |
|end_date | datetime     |    No | end date for filter |

Sample results
```json
{
  "data": {
    "total": 12,
    "processing": 3,
    "unprocess": 9,
    "report_details": [
      {
        "_id": 20,
        "value": {
          "staff_id": 20,
          "processed": 5
        }
      }
    ]
  },
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```
---
#### Messages
Getting all message reports
```ruby
KSequencing.client.image_message_reports()
```
| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :----:| :-----|
| token     | 	string | Yes |User Authorization Token|
| project_id	     | integer      |   No | project id|
|staff_id | integer     |    No | moderator id |
|start_date | datetime     |    No | start date for filter |
|end_date | datetime     |    No | end date for filter |

Sample results
```json
{
  "data": {
    "total": 12,
    "processing": 3,
    "unprocess": 9,
    "report_details": [
      {
        "_id": 20,
        "value": {
          "staff_id": 20,
          "processed": 5
        }
      }
    ]
  },
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```
---
#### Photo tags
Getting all photo tag reports
```ruby
KSequencing.client.photo_tag_reports()
```
| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :----:| :-----|
| token     | 	string | Yes |User Authorization Token|
| project_id	     | integer      |   No | project id|
|staff_id | integer     |    No | moderator id |
|start_date | datetime     |    No | start date for filter |
|end_date | datetime     |    No | end date for filter |

Sample results
```json
{
  "data": {
    "total": 12,
    "processing": 3,
    "unprocess": 9,
    "report_details": [
      {
        "_id": 20,
        "value": {
          "staff_id": 20,
          "processed": 5
        }
      }
    ]
  },
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```
---
