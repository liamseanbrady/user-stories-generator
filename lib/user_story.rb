class UserStory
  attr_reader :actor

  def initialize
    @invalid_input = {}
  end

  def add_actor(input)
    if input.empty? || input.nil?
      @invalid_input[:actor] = "The actor's name cannot be blank"
    else
      @actor = input 
    end
  end

  def error_messages
    @invalid_input
  end
end
