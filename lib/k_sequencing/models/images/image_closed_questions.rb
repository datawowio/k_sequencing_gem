module KSequencing
  # :nodoc:
  class ImageClosedQuestion

    def all(options = {})
      options[:token] ||= KSequencing.project_key
      connection.get('/api/images/closed_questions', options)
    end

    def create(options = {})
      options[:token] ||= KSequencing.project_key
      connection.post('/api/images/closed_questions', options)
    end

    def find_by(options = {})
      options[:token] ||= KSequencing.project_key
      connection.get('/api/images/closed_question', options)
    end

  private

    def connection
      @connection ||= Connection.new
    end

  end

end
