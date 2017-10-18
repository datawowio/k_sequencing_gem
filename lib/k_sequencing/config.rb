# :nodoc:
module KSequencing
  # Configuration loader
  class << self
    attr_writer :user_key, :project_key

    attr_accessor :service_url, :connection_failed_code

    def user_key
      get_key :user_key
    end

    def project_key
      get_key :project_key
    end

    private

    def get_key(name)
      if key = instance_variable_get("@#{name}")
        key
      else
        raise "Not found KSequencing.#{name} configuration, please set it up."
      end
    end
  end

  self.service_url            = 'https://k-sequencing.datawow.io/'
  self.connection_failed_code = 599
end
