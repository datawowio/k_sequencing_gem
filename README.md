# k_sequencing_gem

Image and content moderation services.

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
### Operations about Images
Get image
```ruby
KSequencing.client.get_image_closed_question()
```

| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :----:| :-----|
| id	     | string      |   No | Image id|
|custom_id | string     |    No | Client's image id |

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
    "project_id": null,
    "created_at": "2017-03-14T08:29:40.696Z"
  },
  "meta": {
    "code": 200,
    "message": "success"
  }
}
```
---
#### Image moderation can set 4 kinds of answer
* Closed question - Answer can be only approved, declined or ban.
* Choices - User can set multiple choices for select. It can be radio or checkbox.
* Photo tag - User can create box-like overlays on top of your image and assign messages to each box.
* Message - User can set messages for answer.

For more usage, please read [documentation](docs/documentation.md) for details on our code.

## License

This project is licensed under datawowio
