require 'test_helper'

module KSequencing
  class ImageChoiceTest < Minitest::Test
    IMAGE_CHOICES_URL = 'https://k-sequencing.datawow.io/api/images/choices'.freeze
    IMAGE_CHOICE_URL = 'https://k-sequencing.datawow.io/api/images/choice'.freeze

    def setup
      image_choices_file = File.read('test/fixtures/image_choice/all.json')
      image_choice_file =  File.read('test/fixtures/image_choice/create.json')
      @image_choices = JSON.parse(image_choices_file)
      @image_choice = JSON.parse(image_choice_file)

      @options = {
        token: 'project token'
      }
    end

    def test_all
      stub_request(:get, IMAGE_CHOICES_URL)
        .with(query: { token: options[:token] })
        .to_return(body: JSON.generate(@image_choices), status: 200)
      response = KSequencing::ImageChoice.new.all(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_create
      stub_request(:post, IMAGE_CHOICES_URL)
        .with(headers: { Authorization: options[:token] })
        .to_return(body: JSON.generate(@image_choice), status: 200)
      response = KSequencing::ImageChoice.new.create(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_find
      stub_request(:get, IMAGE_CHOICE_URL)
        .with(query: { token: options[:token] })
        .to_return(body: JSON.generate(@image_choice), status: 200)
      response = KSequencing::ImageChoice.new.find_by(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    private

    attr_reader :options
  end
end
