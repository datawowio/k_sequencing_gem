module KSequencing

  class Client

    def create_choices(options = {})
      connection.post("/api/images/choices", options)
    end

    def create_image_closed_questions(options = {})
      connection.post("/api/images/closed_questions", options)
    end

    def create_messages(options = {})
      connection.post("/api/images/messages", options)
    end

    def create_photo_tags(options = {})
      connection.post("/api/images/photo_tags", options)
    end

    private

    def connection
      @connection ||= Connection.new
    end

  end

end
