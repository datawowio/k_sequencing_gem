require 'test_helper'

module KSequencing
  class ConnectionTest < Minitest::Test
    def test_get_success
      stub_request(:get, 'http://localhost:3000')
        .to_return(body: JSON.generate(data: 'foo', meta: 'bar'), status: 200)
      response = KSequencing::Connection.new.get('http://localhost:3000', {})
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      assert_equal('success', response.message)
    end

    def test_get_failed
      stub_request(:get, 'http://localhost:3000')
        .to_return(status: [500, 'Internal Server Error'])
      response = KSequencing::Connection.new.get('http://localhost:3000', {})
      assert_instance_of(Response, response)
      assert_equal('500', response.status)
    end

    def test_post_success
      stub_request(:post, 'http://localhost:3000')
        .to_return(body: JSON.generate(data: 'foo', meta: { code: 200 }), status: 200)
      response = KSequencing::Connection.new.post('http://localhost:3000', {})
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
    end

    def test_post_failed
      stub_request(:post, 'http://localhost:3000')
        .to_return(status: [500, 'Internal Server Error'])
      response = KSequencing::Connection.new.post('http://localhost:3000', {})
      assert_instance_of(Response, response)
      assert_equal('500', response.status)
    end
  end
end
