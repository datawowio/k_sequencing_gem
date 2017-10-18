require_relative 'k_sequencing/client'
require_relative 'k_sequencing/client_response'
require_relative 'k_sequencing/connection'
require_relative 'k_sequencing/error'
require_relative 'k_sequencing/version'
require_relative 'k_sequencing/config'

# :nodoc:
module KSequencing
  class << self
    def setup
      yield self
    end

    def client
      Client.new
    end
  end
end
