# k_sequencing_gem

Image and content moderation services.

## Getting Started

KSequencing 0.1.2 works with Rails 4.1 onwards. You can add it to your Gemfile with:
```ruby
gem 'k_sequencing'
```
Then run bundle install

You have to contact us [Datawow](https://datawow.io/pages/contact) to get your token. With this token you'll be able to use our gem properly.

## Usage
### Operations about Images
Get image
```ruby
KSequencing.client.get_image_closed_question()
```

| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :----:| :-----|
| token     | 	string | Yes |Project Authorization Token|
| id	     | string      |   No | Image id|
|custom_id | string     |    No | Client's image id |

Note: You must choose id or custom_id for search. Not both.

Sample request
```ruby
KSequencing.client.get_image_closed_question(
  token: "9UPmGGWEwBsJrVnw6844tfpd",
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
      "deadline_at": "2017-06-02T07:19:48.574+00:00",
      "postback_url": "www.example.com",
      "processed_at": null,
      "project_id": 3,
      "staff_id": null,
      "status": "unprocess",
      "created_at": "2017-06-02T07:19:48.574Z",
      "updated_at": "2017-06-02T07:19:48.574Z"
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
| token     | 	string | Yes |User Authorization Token|
| data     | 	string | Yes |Data for moderate|
| postback_url	     | string      | No | Image postback url|
| postback_method     | 	string | No |Postback method|
| custom_id	     | string      |   No |Custom's id|

Sample request

```ruby
KSequencing.client.create_image_closed_questions(
  token: "9UPmGGWEwBsJrVnw6844tfpd",
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
#### Image moderation can set 4 kinds of answer
* Closed question - Answer can be only approved, declined or ban.
* Choices - User can set multiple choices for select. It can be radio or checkbox.
* Photo tag - User can create box-like overlays on top of your image and assign messages to each box.
* Message - User can set messages for answer.

For more usage, please read [documentation](docs/documentation.md) for details on our code.

## License

This project is licensed under datawowio
