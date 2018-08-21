module KSequencing
  # :nodoc:
  class TextConversation
    def all(options = {})
      options[:token] ||= KSequencing.project_key
      options[:per_page] ||= 20
      options[:page] ||= 1
      connection.get('/api/v1/text/text_conversations', options)
    end

    def create(options = {})
      options[:token] ||= KSequencing.project_key
      connection.post('/api/v1/text/text_conversations', options)
    end

    def find_by(options = {})
      options[:token] ||= KSequencing.project_key
      connection.get("/api/v1/text/text_conversations/#{options[:id]}", options)
    end

    private

    def connection
      @connection ||= Connection.new('text')
    end
  end
end
