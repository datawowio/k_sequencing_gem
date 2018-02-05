require 'test_helper'

module KSequencing
  class ImageMessageTest < Minitest::Test
    IMAGE_MESSAGES_URL = 'https://k-sequencing.datawow.io/api/images/messages'.freeze
    IMAGE_MESSAGE_URL = 'https://k-sequencing.datawow.io/api/images/message'.freeze

    def setup
      @image_messages = FileReader.new('test/fixtures/image_message/all.json').read_json
      @image_message = FileReader.new('test/fixtures/image_message/create.json').read_json
      @options = {
        token: 'project token'
      }
    end

    def test_all
      stub_request(:get, IMAGE_MESSAGES_URL)
        .with(query: { token: options[:token] })
        .to_return(body: JSON.generate(image_messages), status: 200)
      response = ImageMessage.new.all(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_create
      stub_request(:post, IMAGE_MESSAGES_URL)
        .with(headers: { Authorization: options[:token] })
        .to_return(body: JSON.generate(image_message), status: 200)
      response = ImageMessage.new.create(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_find
      stub_request(:get, IMAGE_MESSAGE_URL)
        .with(query: { token: options[:token] })
        .to_return(body: JSON.generate(image_message), status: 200)
      response = ImageMessage.new.find_by(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    private

    attr_reader :options, :image_message, :image_messages
  end
end
