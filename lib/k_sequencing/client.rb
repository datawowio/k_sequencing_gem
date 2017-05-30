module KSequencing

  class Client

    def get_choices(options = {})
      connection.get("/api/images/choices",  options)
    end

    def create_choices(options = {})
      connection.post("/api/images/choices", options)
    end

    def get_image_closed_questions(options = {})
      connection.get("/api/images/closed_questions", options)
    end

    def create_image_closed_questions(options = {})
      connection.post("/api/images/closed_questions", options)
    end

    def get_image_closed_question(id, options = {})
      connection.get("/api/images/closed_questions/#{id}", options)
    end

    def get_messages(options = {})
      connection.get("/api/images/messages", options)
    end

    def create_messages(options = {})
      connection.post("/api/images/messages", options)
    end

    def get_photo_tags(options = {})
      connection.get("/api/images/photo_tags", options)
    end

    def create_photo_tags(options = {})
      connection.post("/api/images/photo_tags", options)
    end

    def image_choice_reports(options = {})
      connection.get("/api/reports/images/choice", options)
    end

    def image_closed_question_reports(options = {})
      connection.get("/api/reports/images/closed_question", options)
    end

    def image_message_reports(options = {})
      connection.get("/api/reports/images/message", options)
    end

    def photo_tag_reports(options = {})
      connection.get("/api/reports/images/photo_tag", options)
    end

    def get_projects(options = {})
      connection.get("/api/projects", options)
    end

    def get_project(options = {})
      connection.get("/api/project", options)
    end

    def destroy_user_sessions(options = {})
      connection.delete("/api/sessions/users", options)
    end

    def authenticate_user_sessions(options = {})
      connection.post("/api/sessions/users", options)
    end

    def destroy_project_sessions(options = {})
      connection.delete("/api/sessions/projects", options)
    end

    def authenticate_project_sessions(options = {})
      connection.post("/api/sessions/projects", options)
    end

    private

    def connection
      @connection ||= Connection.new
    end

  end

end
