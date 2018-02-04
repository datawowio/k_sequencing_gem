require 'test_helper'

module KSequencing
  class PredictionTest < Minitest::Test
    PREDICTIONS_URL = 'https://k-sequencing.datawow.io/api/prime/predictions'.freeze

    def setup
      predictions_file = File.read('test/fixtures/prediction/all.json')
      prediction_file =  File.read('test/fixtures/prediction/create.json')
      @prediction = JSON.parse(predictions_file)
      @prediction = JSON.parse(prediction_file)

      @options = {
        token: 'project-token'
      }
    end

    def test_all
      stub_request(:get, PREDICTIONS_URL)
        .with(query: { token: options[:token] })
        .to_return(body: JSON.generate(@prediction), status: 200)
      response = KSequencing::Prediction.new.all(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_create
      stub_request(:post, PREDICTIONS_URL)
        .with(headers: { Authorization: options[:token] })
        .to_return(body: JSON.generate(@prediction), status: 200)
      response = KSequencing::Prediction.new.create(options)
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    def test_find
      mock_id = '1'
      stub_request(:get, PREDICTIONS_URL + '/' + mock_id)
        .with(query: { token: options[:token] })
        .to_return(body: JSON.generate(@prediction), status: 200)
      response = KSequencing::Prediction.new.find_by(options.merge(id: mock_id))
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      refute_nil(response.data)
      refute_nil(response.meta)
    end

    private

    attr_reader :options
  end
end
