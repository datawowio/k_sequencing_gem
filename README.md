# Image and content moderation services.


## There are 5 avalable for API
* Closed questions(Standard Criteria (5 mins response time)) - Answer can be only approved, declined or ban(kenta).
* Choices(Yes or No Question from Image (30 mins response time)) - This model use to ask question with multiple choice. Anwser can be one or multiple.
* Photo tags(Tag an object in the image (60 mins response time)) - This model use to create a selection area to find where answer is, by drag the area on image from webpage.
* Messages(Message Question from Image (30 mins response time)) - This model allow moderator type the anwser on what they see.
* Predictions(Images (AI Beta / 95% accuracy)) - Use AI to prediction the result

##### Please see more usage [documentation](docs/documentation.md) for details on our guideline.



## Getting Started

KSequencing 0.1.23 works with Rails 4.1 onwards. You can add it to your Gemfile with:
```ruby
gem 'k_sequencing', '~> 0.1.23'
```
Then run bundle install

Next, you need to run the generator:

```console
$ rails generate k_sequencing:install
```

The generator will install an initializer which describes ALL of KSequencing's configuration options. It is *imperative* that you take a look at it. When you are done, you are ready to add KSqeuencing to any of your codes.

You have to contact us [Datawow](https://datawow.io/pages/contact) to get your token. With this token you'll be able to use our gem properly.

## Usage
There are 3 oparations of each model as the same name see example below

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

```json
{
  "value": {
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
  "total": nil,
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```
---
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
  "value": {
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
  "status": 201,
  "message": "success",
  "total": 0,
  "meta": nil
}
```

###### Sample postback data
```
POST "https://example.com/callbacks?answer=declined&custom_id=custom_id&image_id=5a40cfc2fb9d7f27354c62b5&task_id=5a40cfc2fb9d7f27354c62b5"
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
  "value": {
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
  "total": nil,
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

However `token: "[you_token]"` you can config in configuration file is not necessary to send to method every time you request, if you have one project token we recommeded this approach

##### Please see more usage [documentation](docs/documentation.md) for details on our guideline.

## License

This project is licensed under datawowio
