require 'test_helper'

module KSequencing
  class ImageClosedQuestionTest < Minitest::Test
    IMAGE_CLOSED_QUESTIONS_URL = 'https://k-sequencing.datawow.io/api/images/closed_questions'.freeze
    IMAGE_CLOSED_QUESTION_URL = 'https://k-sequencing.datawow.io/api/images/closed_question'.freeze

    def setup
      @image_closed_questions = FileReader.new('test/fixtures/image_closed_question/all.json').read_json
      @image_closed_question = FileReader.new('test/fixtures/image_closed_question/create.json').read_json
      @options = {
        token: 'project token'
      }
    end

    def test_all
      stub_request(:get, IMAGE_CLOSED_QUESTIONS_URL)
        .with(query: { token: options[:token] })
        .to_return(body: JSON.generate(image_closed_questions), status: 200)
      response = ImageClosedQuestion.new.all(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_create
      stub_request(:post, IMAGE_CLOSED_QUESTIONS_URL)
        .with(headers: { Authorization: options[:token] })
        .to_return(body: JSON.generate(image_closed_question), status: 200)
      response = ImageClosedQuestion.new.create(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_find
      stub_request(:get, IMAGE_CLOSED_QUESTION_URL)
        .with(query: { token: options[:token] })
        .to_return(body: JSON.generate(image_closed_question), status: 200)
      response = ImageClosedQuestion.new.find_by(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    private

    attr_reader :options, :image_closed_question, :image_closed_questions
  end
end
