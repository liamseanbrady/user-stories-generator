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

  def valid?
    error_messages.empty?
  end

  def synthesize
    if valid?
      create_finished_story
    else
      raise StandardError, 'user story segments must be valid'
    end
  end

  private

  def add_section(section_name, content)
    if content.empty? || content.nil?
      @invalid_input[section_name.to_sym] = "#{section_name} cannot be blank"
    else
      self.send("#{section_name.to_sym}=", content)
    end
  end

  def create_finished_story
    vowels = %w(A E I O U a e i o u)
    if vowels.include?(actor.slice(0)) && !actor.match(/\buser\b/i)
      story = "As an #{actor}, I want to #{goal} so that #{reason}"
    else 
      story = "As a #{actor}, I want to #{goal} so that #{reason}"
    end

    story
  end
end
