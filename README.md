# Image and content moderation services.


## There are 5 avalable for API 
* Closed questions - Answer can be only approved, declined or ban(kenta).
* Choices - This model use to ask question with multiple choice. Anwser can be one or multiple.
* Photo tags - This model use to create a selection area to find where answer is, by drag the area on image from webpage.
* Messages - This model allow moderator type the anwser on what they see.
* Predictions - Use AI to prediction the result

##### Please see more usage [documentation](docs/documentation.md) for details on our guideline.



## Getting Started

KSequencing 0.1.9 works with Rails 4.1 onwards. You can add it to your Gemfile with:
```ruby
gem 'k_sequencing'
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
KSequencing.[model].find_by()
```

| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :----:| :-----|
|token | string     |    Yes | Project token |
| id	     | string      |   No | Image id|
|custom_id | string     |    No | Client's image id |\

Note: You must choose id or custom_id for search. Not both.

###### Sample request

```ruby
KSequencing.[model].find_by({
  token: "[you_token]",
  id: "59311194e99991b2ca8979f1"
})
```

or

```ruby
KSequencing.[model].find_by({
  token: "[you_token]",
  custom_id: "59311194e99991b2ca8979f1"
})
```

###### Sample results
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
<Enter>
---
#### Create images

```ruby
KSequencing.[model].create()
```

| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :-----:| :-----|
|token | string     |    Yes | Project token |
| data     | 	string | Yes |Data for moderate|
| postback_url	     | string      | No | Image postback url|
| postback_method     | 	string | No |Postback method|
| custom_id	     | string      |   No |Custom's id|

###### Sample request

```ruby
KSequencing.[model].create({
  token: "[you_token]"
  data: "image_url"
  ....
})
```

###### Sample results
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
    "project_id": null,
    "created_at": "2017-03-14T08:29:40.696Z"
  },
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```
<Enter>
---

#### Get list of images
```ruby
KSequencing.[model].all()
```

| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :----:| :-----|
|token | string     |    Yes | Project token |
| page	     | integer       |   No | Image id|
|per_page | integer      |    No | Client's image id |\

Note: You must choose id or custom_id for search. Not both.

###### Sample request

```ruby
KSequencing.[model].all({
  token: "[you_token]"
})
```


###### Sample results
```json
{
  "data": {
    "images": [
      {
        "id": "5a0d5a0c0deb540ab9c56e4e",
        "allow_empty": false,
        "answer": [],
        "categories": ["face", "eye"],
        "credit_charged": 0,
        "custom_id": null,
        "data": "image_url",
        "instruction": "face",
        "multiple": false,
        "postback_url": "www.example.com",
        "processed_at": null,
        "project_id": 94,
        "status": "unprocess"
      }
    ]
  },
  "meta": {
    "code": 200,
    "message": "success",
    "current_page": 1,
    "next_page": 2,
    "prev_page": -1,
    "total_pages": 13,
    "total_count": 13
  }
}
```
<Enter>

However `token: "[you_token]"` you can config in configuration file is not necessary to send to method every time you request, if you have one project token we recommeded this approach

## License

This project is licensed under datawowio
