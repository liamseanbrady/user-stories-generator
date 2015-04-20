class UserStory
  attr_accessor :actor, :goal, :reason

  def initialize
    @invalid_input = {}
  end

  def add_actor(input)
    add_section(:actor, input)
  end

  def add_goal(input)
    add_section(:goal, input)
  end
  
  def add_reason(input)
    add_section(:reason, input)
  end

  def error_messages
    @invalid_input
  end

  private

  def add_section(section_name, content)
    if content.empty? || content.nil?
      @invalid_input[section_name.to_sym] = "#{section_name} cannot be blank"
    else
      self.send("#{section_name.to_sym}=", content)
    end
  end
end
