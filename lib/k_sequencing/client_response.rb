module KSequencing

  class Response

    attr_reader :count, :message, :status
    attr_accessor :value, :meta

    def initialize(value, success, response_code = "", response_message = "success", meta = nil, total = 0)
      @value = value
      @success = success
      @status = response_code
      @message = response_message
      @total = total
      @meta = meta
    end

    def successful?
      !something.nil?
    end

  end

end
