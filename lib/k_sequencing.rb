require_relative 'k_sequencing/client'
require_relative 'k_sequencing/client_response'
require_relative 'k_sequencing/connection'
require_relative 'k_sequencing/error'
require_relative 'k_sequencing/version'

module KSequencing
  def self.client
    Client.new
  end
end
