# k_sequencing_gem

Image and content moderation services.

## Getting Started

KSequencing 0.0.1 works with Rails 4.1 onwards. You can add it to your Gemfile with:
```ruby
gem 'k_sequencing'
```
Then run bundle install

You have to contact us [Kiyo](http://kiyo.tech/pages/contact) to get your token. With this token you'll be able to use our gem properly.

## Usage
### Operations about Images
Getting all images
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
    "data": "image.jpg",
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
#### Image moderation can set 4 kinds of answer
* Closed question - Answer can be only approved, declined or ban.
* Choices - User can set multiple choices for select. It can be radio or checkbox.
* Photo tag - User can create box-like overlays on top of your image and assign messages to each box.
* Message - User can set messages for answer.

For more usage, please read [documentation](docs/documentation.md) for details on our code.

## License

This project is licensed under datawowio
