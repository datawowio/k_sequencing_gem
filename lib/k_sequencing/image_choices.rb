module KSequencing
  # :nodoc:
  class ImageChoice

    def create(options = {})
      options[:token] ||= KSequencing.project_key
      connection.post('/api/images/choices', options)
    end

    def all(options = {})
      options[:token] ||= KSequencing.project_key
      connection.get('/api/images/choices', options)
    end

    def find_by(options = {})
      options[:token] ||= KSequencing.project_key
      connection.get('/api/images/choice', options)
    end

    private

    def connection
      @connection ||= Connection.new
    end

  end

end
