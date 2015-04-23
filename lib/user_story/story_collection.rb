class StoryCollection < Array
  def add_story(story)
    if story.is_a?(Story)
      self << story
    end
  end

  def to_markdown
    markdown = ''
    return markdown if self.empty?

    each_with_index do |story, index|
      markdown << story.to_markdown
      markdown << "\n\n" unless index == self.size - 1
    end

    markdown
  end
end
