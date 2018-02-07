require 'test_helper'

module KSequencing
  class KSequencingTest < Minitest::Test
    def test_setup
      KSequencing.setup { |config| }
    end

    def test_client
      client = KSequencing.client
      refute_nil(client)
    end

    def test_image_closed_question
      closed_question = KSequencing.image_closed_question
      refute_nil(closed_question)
    end

    def test_image_photo_tag
      photo_tag = KSequencing.image_photo_tag
      refute_nil(photo_tag)
    end

    def test_image_choice
      choice = KSequencing.image_choice
      refute_nil(choice)
    end

    def test_image_message
      message = KSequencing.image_message
      refute_nil(message)
    end

    def test_prediction
      prediction = KSequencing.prediction
      refute_nil(prediction)
    end
  end
end
