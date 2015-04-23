require_relative 'spec_helper'
require 'user_story'

describe 'Story Collection' do
  describe '.add_story' do
    it 'does not add a story to the story collection if the story to add is not a Story object' do
      stories = StoryCollection.new

      stories.add_story([])

      stories.size.must_equal 0
    end
    it 'add a story to the story collection if the story to add is a Story object' do
      stories = StoryCollection.new
      story = Story.new
      story.add_actor('Actor')
      story.add_goal('do TDD')
      story.add_reason('I can have less errors in my code')

      stories.add_story(story)

      stories.size.must_equal 1
    end
  end

  describe 'to_markdown' do
    it 'returns an empty string if there are no stories in the story collection' do
      stories = StoryCollection.new

      stories.to_markdown.must_equal('')
    end

    it 'returns a story in markdown format with no new line if there is only one story' do
      stories = StoryCollection.new
      story_one = Story.new
      story_one.add_actor('Actor')
      story_one.add_goal('do TDD')
      story_one.add_reason('I can have less errors in my code')
      stories.add_story(story_one)
      markdown = '- As an Actor, I want to do TDD so that I can have less errors in my code'

      stories.to_markdown.must_equal markdown
    end

    it 'returns markdown with a new line after each story except the last when there are many stories in the collection' do
      stories = StoryCollection.new
      story_one = Story.new
      story_one.add_actor('Actor')
      story_one.add_goal('do TDD')
      story_one.add_reason('I can have less errors in my code')
      story_two = Story.new
      story_two.add_actor('Actor')
      story_two.add_goal('have automated tests')
      story_two.add_reason('I can focus on writing code')
      stories.add_story(story_one)
      stories.add_story(story_two)
      markdown = '- As an Actor, I want to do TDD so that I can have less errors in my code'
      markdown += "\n"
      markdown += "\n"
      markdown += '- As an Actor, I want to have automated tests so that I can focus on writing code'

      stories.to_markdown.must_equal markdown
    end
  end
end
