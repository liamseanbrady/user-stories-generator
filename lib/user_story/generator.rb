class Generator
  attr_reader :title

  def initialize(input = 'User Stories')
    @title = shorten_title(input)
  end

  def generate_markdown(*stories)
    title_markdown = "## #{title}"
    return title_markdown if stories.empty?
    stories_markdown = ''
    stories.each { |story| stories_markdown += format_story(story) }
    title_markdown + newlines(2) + stories_markdown.chomp
  end

  private
  
  def shorten_title(input)
    if input.length >= 30
      counter = 30
      loop do
        input = input.slice(0...counter)
        if input.end_with?(' ') || input.empty?
          input.slice(0...counter - 1)
          break
        end
        counter = counter - 1
      end
      formatted_title = input + 'User Stories'
    else
      formatted_title = input == 'User Stories' ? input : input + ' User Stories'
    end

    return formatted_title
  end
  
  def format_story(story)
    "- #{story}" + newlines(1)
  end

  def newlines(number = 1)
    newlines = ""
    number.times { newlines += "\n" }
    newlines
  end
end
