module KSequencing

  class Client

    def create_image_choices(options = {})
      connection.post("/api/images/choices", options)
    end

    def create_image_closed_questions(options = {})
      connection.post("/api/images/closed_questions", options)
    end

    def create_image_messages(options = {})
      connection.post("/api/images/messages", options)
    end

    def create_image_photo_tags(options = {})
      connection.post("/api/images/photo_tags", options)
    end

    def get_image_choice(options = {})
      connection.get("/api/images/choice", options)
    end

    def get_image_closed_question(options = {})
      connection.get("/api/images/closed_question", options)
    end

    def get_image_message(options = {})
      connection.get("/api/images/message", options)
    end

    def get_image_photo_tag(options = {})
      connection.get("/api/images/photo_tag", options)
    end

    private

    def connection
      @connection ||= Connection.new
    end

  end

end
