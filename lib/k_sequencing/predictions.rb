module KSequencing
  # :nodoc:
  class Prediction

    def create(options = {})
      options[:token] ||= KSequencing.project_key
      connection.post('/api/prime/predictions', options)
    end

    def all(options = {})
      options[:token] ||= KSequencing.project_key
      connection.get('/api/prime/predictions' , options)
    end

    def find_by(options = {})
      options[:token] ||= KSequencing.project_key
      connection.get("/api/prime/predictions/#{options[:id]}", options)
    end

    private

    def connection
      @connection ||= Connection.new
    end

  end

end
