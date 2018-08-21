## Images class
  
We're going to explant about parameter for creation and example of use

# Table of Content
- [Choice class](#choice-class)
- [Closed Question class](#closed-question-class)
- [Image message class](#image-messages-class)
- [Photo tags class](#photo-tags-class)
- [Common function](#common-function)

## Choice class
Description: Yes or No Question from Image (30 mins response time) - This model use to create select list on a moderator screen and let's they answer your question on what they're seeing. Answer can be only one or multiple  choice

#### Create 

```ruby
params = { ..., token: '_token' }
KSequencing.image_choice.create(params)
```
#### params 

|Field        | Type           | Required  | Description |
| ------------- |:-------------:| :-----:| :-----|
| instruction| string|**Yes**| Tell moderator what answer you expected and what image is|
|categories | Array[string]|**Yes** | List of answers that you were expected. sparate by use space |
| data |string | **Yes** |URL of image|
| postback_url| string|No| URL for answer callback once image has been checked|
| postback_method|string | No |Configuration HTTP method GET POST PUT PATCH|
| allow_empty| boolean|No|Allow answer can be blank. default is `false`|
|multiple | boolean | No | Configuration for multiple selection of category to answer default is `false` |
| custom_id | string | No |Custom ID that used for search|
---


## Closed Question class
Description: Standard Criteria (5 mins response time) - Answer can be only approved, declined or ban
### Create
```ruby
params = { ..., token: '_token' }
KSequencing.image_closed_question.create(params)
```
#### params
| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :-----:| :-----|
| data     | 	string | **Yes** |URL of image|
| postback_url	     | string      | No | URL for answer callback once image has been checked|
| postback_method     | 	string | No |Configuration HTTP method GET POST PUT PATCH|
| custom_id	     | string      |   No |Custom ID that used for search|
---



## Image messages class
Description: Message Question from Image (30 mins response time) - Allow a moderator to typing a answer on what they're seeing.

### Create
```ruby
params = { ..., token: '_token' }
KSequencing.image_message.create(params)
```


#### params
| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :-----:| :-----|
| instruction	     | string      |   **Yes** | Tell moderator what answer you expected and what image is|
| data     | 	string | **Yes** |URL of image|
| postback_url	     | string      | No | URL for answer callback once image has been checked|
| postback_method     | 	string | No |Configuration HTTP method GET POST PUT PATCH|
| custom_id	     | string      |   No |Custom ID that used for search|

---

  
## Photo tags class
Description: Tag an object in the image (60 mins response time) - This model use to create answer by area. Moderator will be create a selection square on a image by following your instruction to finding the exactly answer on the image

### Create
```python
>>> from datawow.images import PhotoTag as photo_tag
>>> result = photo_tag("PROJECT KEY").create(params=param)
```

#### params
| Field | Type| Required | Description |
| ------------- |:-------------:| :-----:| :-----|
|instruction| string|**Yes** |Tell moderator what answer you expected and what image is|
|data|string| **Yes** |URL of image|
|postback_url|string| No |URL for answer callback once image has been checked|
|postback_method|string | No |Configuration HTTP method GET POST PUT PATCH|
|custom_id|string|No|Custom ID that used for search|

---
# Common function
For every classes there are common functions to get list of data and find by ID. We're going to show you how to use it.

## Query list of data by  `all()`

```ruby
params = { ..., token: '_token' }
KSequencing.[model].all(params)
```
#### params
| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :-----:| :-----|
| page     | 	interger | No | default 0|
| per_page 	     | string      | No | default 20 |


## Find data with ID by  `find_by()`
```ruby
params = { id: '_id', token: '_token' }
KSequencing.[model].find_by(params)
```
#### params
| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :----:| :-----|
| id	     | string  |   **Yes** | Image's ID or custom ID which is you were assigned|
