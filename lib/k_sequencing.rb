require_relative 'k_sequencing/client'
require_relative 'k_sequencing/client_response'
require_relative 'k_sequencing/connection'
require_relative 'k_sequencing/error'
require_relative 'k_sequencing/version'
require_relative 'k_sequencing/image_closed_questions'
require_relative 'k_sequencing/image_photo_tags'
require_relative 'k_sequencing/image_choices'
require_relative 'k_sequencing/image_messages'
require_relative 'k_sequencing/predictions'
# :nodoc:
module KSequencing
  mattr_accessor :user_key, :project_key

  class << self
    def setup
      yield self
    end

    def client
      Client.new
    end

    def image_closed_question
      ImageClosedQuestion.new
    end

    def image_photo_tag
      ImagePhotoTag.new
    end

    def image_choice
      ImageChoice.new
    end

    def image_message
      ImageMessage.new
    end

    def prediction
      Prediction.new
    end

  end

end
