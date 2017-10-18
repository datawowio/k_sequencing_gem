require 'test_helper'

class TestConfig < TestBase
  def test_default_values_are_set
    assert_equal 'https://k-sequencing.datawow.io/', KSequencing.service_url
    assert_equal 599, KSequencing.connection_failed_code
  end

  def test_keys_are_set
    assert_equal 'project-key', KSequencing.project_key
    assert_equal 'user-key', KSequencing.user_key
  end
end
