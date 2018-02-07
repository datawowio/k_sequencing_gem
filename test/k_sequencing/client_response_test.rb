require 'test_helper'

module KSequencing
  class ResponseTest < Minitest::Test
    def test_new_success_response
      response = Response.new('response', true, 200, 'success', 'meta', 5)
      refute_nil(response)
      refute_nil(response.data)
    end
  end
end
