module KSequencing
  # :nodoc:
  class Prediction
    def all(options = {})
      options[:token] ||= KSequencing.project_key
      connection.get('/api/v1/prime/predictions', options)
    end

    def create(options = {})
      options[:token] ||= KSequencing.project_key
      connection.post('/api/v1/prime/predictions', options)
    end

    def find_by(options = {})
      options[:token] ||= KSequencing.project_key
      options[:path_param] = true
      connection.get("/api/v1/prime/predictions/#{options[:id]}", options)
    end

    private

    def connection
      @connection ||= Connection.new
    end
  end
end
