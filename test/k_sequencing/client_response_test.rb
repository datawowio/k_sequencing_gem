require 'test_helper'

module KSequencing
  class ResponseTest < Minitest::Test
    def test_new_success_response
      response = Response.new('response', 200, 'success', 'meta', 5)
      refute_nil(response)
      refute_nil(response.data)
      assert_equal(true, response.successful?)
    end

    def test_failure_response
      response = Response.new('response', 500, 'failure', 'meta')
      refute_nil(response)
      refute_nil(response.data)
      assert_equal(false, response.successful?)
    end
  end
end
