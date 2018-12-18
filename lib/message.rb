class Message

  attr_reader :text_input, :timestamp

  def initialize(text_input)
    @text_input = text_input
    @timestamp = Time.new
  end

end
