module KSequencing
  # :nodoc:
  class ImageMessage

    def create(options = {})
      options[:token] ||= KSequencing.project_key
      connection.post('/api/images/messages', options)
    end

    def all(options = {})
      options[:token] ||= KSequencing.project_key
      connection.get('/api/images/messages', options)
    end

    def find_by(options = {})
      options[:token] ||= KSequencing.project_key
      connection.get('/api/images/message', options)
    end

    private

    def connection
      @connection ||= Connection.new
    end

  end

end
