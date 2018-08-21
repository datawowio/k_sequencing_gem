module KSequencing
  # :nodoc:
  class ImagePhotoTag
    def all(options = {})
      options[:token] ||= KSequencing.project_key
      options[:per_page] ||= 20
      options[:page] ||= 1
      connection.get('/api/images/photo_tags', options)
    end

    def create(options = {})
      options[:token] ||= KSequencing.project_key
      connection.post('/api/images/photo_tags', options)
    end

    def find_by(options = {})
      options[:token] ||= KSequencing.project_key
      connection.get("/api/projects/images/#{options[:id]}", options)
    end

    private

    def connection
      @connection ||= Connection.new('image')
    end
  end
end
