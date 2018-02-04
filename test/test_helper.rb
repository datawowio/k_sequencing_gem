$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'k_sequencing'
require 'minitest/autorun'
require 'webmock/minitest'

# class TestBase < Minitest::Test
#   def setup
#     KSequencing.user_key    = 'user-key'
#     KSequencing.project_key = 'project-key'
#   end
# end
