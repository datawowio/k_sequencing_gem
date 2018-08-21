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
| custom_id	      | string | No  | Custom id|

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
KSequencing.client.find_image("5a40be59fb9d7f27354c5efa", { token: "[your_token]" })
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
if the prediction [ai_human] is processed by a human, you will find answer human from Get list of predictions
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
