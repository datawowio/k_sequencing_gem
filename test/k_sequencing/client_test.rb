require 'test_helper'

module KSequencing
  class ClientTest < TestBase
    def test_create_image_choices
      stub_request(:post, IMAGE_CHOICES_URL)
        .with(headers: { Authorization: options[:token] })
        .to_return(body: JSON.generate(image_choice), status: 200)
      response = client.create_image_choices(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_create_image_closed_question
      stub_request(:post, IMAGE_CLOSED_QUESTIONS_URL)
        .with(headers: { Authorization: options[:token] })
        .to_return(body: JSON.generate(image_closed_question), status: 200)
      response = client.create_image_closed_questions(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_create_image_messages
      stub_request(:post, IMAGE_MESSAGES_URL)
        .with(headers: { Authorization: options[:token] })
        .to_return(body: JSON.generate(image_message), status: 200)
      response = client.create_image_messages(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_create_image_photo_tag
      stub_request(:post, IMAGE_PHOTO_TAGS)
        .with(headers: { Authorization: options[:token] })
        .to_return(body: JSON.generate(image_photo_tags), status: 200)
      response = client.create_image_photo_tags(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_create_prediction
      stub_request(:post, PREDICTIONS_URL)
        .with(headers: { Authorization: options[:token] })
        .to_return(body: JSON.generate(prediction), status: 200)
      response = client.create_prediction(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_list_image_choice
      stub_request(:get, IMAGE_CHOICES_URL)
        .with(query: { token: options[:token] })
        .to_return(body: JSON.generate(image_choices), status: 200)
      response = client.get_image_choice(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_list_image_closed_question
      stub_request(:get, IMAGE_CLOSED_QUESTIONS_URL)
        .with(query: { token: options[:token] })
        .to_return(body: JSON.generate(image_closed_questions), status: 200)
      response = client.get_image_closed_question(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_list_image_message
      stub_request(:get, IMAGE_MESSAGES_URL)
        .with(query: { token: options[:token] })
        .to_return(body: JSON.generate(image_messages), status: 200)
      response = client.get_image_message(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_list_image_photo_tag
      stub_request(:get, IMAGE_PHOTO_TAGS)
        .with(query: { token: options[:token] })
        .to_return(body: JSON.generate(image_photo_tags), status: 200)
      response = client.get_image_photo_tag(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_list_prediction
      stub_request(:get, PREDICTIONS_URL)
        .with(query: { token: options[:token] })
        .to_return(body: JSON.generate(prediction), status: 200)
      response = client.get_prediction(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_find_image_choice
      stub_request(:get, IMAGE_CHOICE_URL)
        .with(query: { token: options[:token] })
        .to_return(body: JSON.generate(image_choice), status: 200)
      response = client.find_by_id_image_choice(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_find_image_closed_question
      stub_request(:get, IMAGE_CLOSED_QUESTION_URL)
        .with(query: { token: options[:token] })
        .to_return(body: JSON.generate(image_closed_question), status: 200)
      response = client.find_by_id_image_closed_question(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_find_image_message
      stub_request(:get, IMAGE_MESSAGE_URL)
        .with(query: { token: options[:token] })
        .to_return(body: JSON.generate(image_message), status: 200)
      response = client.find_by_id_image_message(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_find_photo_tag
      stub_request(:get, IMAGE_PHOTO_TAG)
        .with(query: { token: options[:token] })
        .to_return(body: JSON.generate(image_photo_tag), status: 200)
      response = client.find_by_id_image_photo_tag(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_find_prediction
      mock_id = '1'
      stub_request(:get, PREDICTIONS_URL + '/' + mock_id)
        .with(query: { token: options[:token] })
        .to_return(body: JSON.generate(prediction), status: 200)
      response = client.find_by_id_prediction(mock_id, options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_find_image
      mock_id = '1'
      stub_request(:get, IMAGE_URL + '/' + mock_id)
        .with(query: { token: options[:token] })
        .to_return(body: JSON.generate(prediction), status: 200)
      response = client.find_image(mock_id, options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    private

    def client
      @client ||= KSequencing.client
    end
  end
end
