module KSequencing
  # :nodoc:
  class ImageChoice

    def all(options = {})
      options[:token] ||= KSequencing.project_key
      connection.get('/api/v1/images/choices', options)
    end

    def create(options = {})
      options[:token] ||= KSequencing.project_key
      connection.post('/api/v1/images/choices', options)
    end

    def find_by(options = {})
      options[:token] ||= KSequencing.project_key
      connection.get('/api/v1/images/choice', options)
    end

  private

    def connection
      @connection ||= Connection.new
    end

  end

end
