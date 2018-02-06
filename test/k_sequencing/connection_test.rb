require 'test_helper'

module KSequencing
  class ConnectionTest < Minitest::Test
    def test_get_success
      stub_request(:get, 'http://localhost:3000')
        .to_return(body: JSON.generate(data: 'foo', meta: 'bar'), status: 200)
      response = connection.get('http://localhost:3000', {})
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
      assert_equal('success', response.message)
    end

    def test_get_failed
      stub_request(:get, 'http://localhost:3000')
        .to_return(status: [500, 'Internal Server Error'])
      response = connection.get('http://localhost:3000', {})
      assert_instance_of(Response, response)
      assert_equal('500', response.status)
    end

    def test_post_success
      stub_request(:post, 'http://localhost:3000')
        .to_return(body: JSON.generate(data: 'foo', meta: { code: 200 }), status: 200)
      response = connection.post('http://localhost:3000', {})
      assert_instance_of(Response, response)
      assert_equal(200, response.status)
    end

    def test_post_failed
      stub_request(:post, 'http://localhost:3000')
        .to_return(status: [500, 'Internal Server Error'])
      response = connection.post('http://localhost:3000', {})
      assert_instance_of(Response, response)
      assert_equal('500', response.status)
    end

    def test_connection_failed
      stub_request(:get, 'http://localhost:3000')
        .to_raise(Faraday::ConnectionFailed.new('connection failed'))
      response = connection.get('http://localhost:3000')
      assert_instance_of(Response, response)
    end

    def test_bad_request_status
      stub_request(:get, 'http://localhost:3000')
        .to_return(status: 400, body: JSON.generate(error: 'error'))
      response = connection.get('http://localhost:3000', {})
      assert_instance_of(Response, response)
      assert_equal('400', response.status)
    end

    def test_forbidden_status
      stub_request(:get, 'http://localhost:3000')
        .to_return(status: 403)
      response = connection.get('http://localhost:3000', {})
      assert_instance_of(Response, response)
      assert_equal('403', response.status)
    end

    def test_not_found_status
      stub_request(:get, 'http://localhost:3000')
        .to_return(status: 404)
      response = connection.get('http://localhost:3000', {})
      assert_instance_of(Response, response)
      assert_equal('404', response.status)
    end

    def test_edge_case_error
      stub_request(:get, 'http://localhost:3000')
        .to_return(status: 505)
      response = connection.get('http://localhost:3000', {})
      assert_instance_of(Response, response)
      assert_equal('505', response.status)
    end

    private

    def connection
      @connection ||= KSequencing::Connection.new
    end
  end
end
