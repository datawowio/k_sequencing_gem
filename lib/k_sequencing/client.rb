module KSequencing
  # :nodoc:
  class Client
    def create_image_choices(options = {})
      options[:token] ||= KSequencing.project_key
      connection.post('/api/v1/images/choices', options)
    end

    def create_image_closed_questions(options = {})
      options[:token] ||= KSequencing.project_key
      connection.post('/api/v1/images/closed_questions', options)
    end

    def create_image_messages(options = {})
      options[:token] ||= KSequencing.project_key
      connection.post('/api/v1/images/messages', options)
    end

    def create_image_photo_tags(options = {})
      options[:token] ||= KSequencing.project_key
      connection.post('/api/v1/images/photo_tags', options)
    end

    def create_prediction(options = {})
      options[:token] ||= KSequencing.project_key
      connection.post('/api/v1/prime/predictions', options)
    end

    # -------------------------------- list data ----------------------------------
    def get_image_choice(options = {})
      options[:token] ||= KSequencing.project_key
      connection.get('/api/v1/images/choices', options)
    end

    def get_image_closed_question(options = {})
      options[:token] ||= KSequencing.project_key
      connection.get('/api/v1/images/closed_questions', options)
    end

    def get_image_message(options = {})
      options[:token] ||= KSequencing.project_key
      connection.get('/api/v1/images/messages', options)
    end

    def get_image_photo_tag(options = {})
      options[:token] ||= KSequencing.project_key
      connection.get('/api/v1/images/photo_tags', options)
    end

    def get_prediction(options = {})
      options[:token] ||= KSequencing.project_key
      connection.get('/api/v1/prime/predictions', options)
    end

    # ------------------------------ find by id -------------------------------
    def find_by_id_image_choice(options = {})
      options[:token] ||= KSequencing.project_key
      connection.get('/api/v1/images/choice', options)
    end

    def find_by_id_image_closed_question(options = {})
      options[:token] ||= KSequencing.project_key
      connection.get('/api/v1/images/closed_question', options)
    end

    def find_by_id_image_message(options = {})
      options[:token] ||= KSequencing.project_key
      connection.get('/api/v1/images/message', options)
    end

    def find_by_id_image_photo_tag(options = {})
      options[:token] ||= KSequencing.project_key
      connection.get('/api/v1/images/photo_tag', options)
    end

    def find_by_id_prediction(id, options = {})
      options[:token] ||= KSequencing.project_key
      connection.get("/api/v1/prime/predictions/#{id}", options)
    end

    def find_image(id, options = {})
      options[:token] ||= KSequencing.project_key
      connection.get("/api/v1/projects/images/#{id}", options)
    end

    private

    def connection
      @connection ||= Connection.new
    end
  end
end
