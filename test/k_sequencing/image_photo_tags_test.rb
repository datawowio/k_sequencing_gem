require 'test_helper'

module KSequencing
  class ImagePhotoTagsTest < Minitest::Test
    IMAGE_PHOTO_TAGS = 'https://k-sequencing.datawow.io/api/images/photo_tags'.freeze
    IMAGE_PHOTO_TAG = 'https://k-sequencing.datawow.io/api/images/photo_tag'.freeze

    def setup
      @image_photo_tags = FileReader.new('test/fixtures/image_photo_tag/all.json').read_json
      @image_photo_tag = FileReader.new('test/fixtures/image_photo_tag/create.json').read_json
      @options = {
        token: 'project token'
      }
    end

    def test_all
      stub_request(:get, IMAGE_PHOTO_TAGS)
        .with(query: { token: options[:token] })
        .to_return(body: JSON.generate(image_photo_tags), status: 200)
      response = ImagePhotoTag.new.all(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_create
      stub_request(:post, IMAGE_PHOTO_TAGS)
        .with(headers: { Authorization: options[:token] })
        .to_return(body: JSON.generate(image_photo_tags), status: 200)
      response = ImagePhotoTag.new.create(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_find
      stub_request(:get, IMAGE_PHOTO_TAG)
        .with(query: { token: options[:token] })
        .to_return(body: JSON.generate(image_photo_tag), status: 200)
      response = ImagePhotoTag.new.find_by(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    private

    attr_reader :options, :image_photo_tag, :image_photo_tags
  end
end
