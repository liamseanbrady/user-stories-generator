require_relative 'spec_helper'
require 'user_story'

describe 'Generator' do
  describe '.new' do
    it "creates a new generator object with a title of 'User Stories' when no parameters are passed in" do
      generator = Generator.new

      generator.title.must_equal 'User Stories'
    end
    
    it "creates a new generator object with '<user input> User Stories' when a parameter is passed in" do
      generator = Generator.new('Trello Rat')

      generator.title.must_equal 'Trello Rat User Stories'
    end

    it "shortens user input to 30 characters or less, preferably at end of word" do
      generator = Generator.new("The Cool Trello Rat super cool app")

      generator.title.must_equal 'The Cool Trello Rat super User Stories'
    end
    
    it "shortens user input to 30 characters or less, preferably at end of word" do
      generator = Generator.new("The Cool Trello Rat superrrrrrrrrrrrrrrrr cool app")

      generator.title.must_equal 'The Cool Trello Rat User Stories'
    end

    it "returns 'User Stories' when input is one unbroken string less than 30 characters" do
      generator = Generator.new("TheCoolTrelloRatsuperrrrrrrrrrrrrrrrrcoolapp")

      generator.title.must_equal 'User Stories'
    end
  end

  describe '#generate_markdown' do
    it 'returns an empty markdown document with a title when given no input' do
      generator = Generator.new('Trello Rat')

      generator.generate_markdown.must_equal '## Trello Rat User Stories'
    end

    it 'returns a markdown document with with a title and a user story when given one user story' do
      generator = Generator.new('Trello Rat')
      story = Story.new
      story.add_actor('User')
      story.add_goal('do TDD')
      story.add_reason('I can have less errors in my code')
      user_story = story.synthesize

      markdown = ""
      markdown += "## Trello Rat User Stories"
      markdown += "\n"
      markdown += "\n"
      markdown += "- As a User, I want to do TDD so that I can have less errors in my code"

      generator.generate_markdown(user_story).must_equal markdown
    end

    it 'returns a markdown document with a title and user stories when given more than one story' do
      generator = Generator.new('Trello Rat')

      user_stories = []

      story_one = Story.new
      story_one.add_actor('User')
      story_one.add_goal('do TDD')
      story_one.add_reason('I can have less errors in my code')
      user_stories << story_one.synthesize

      story_two = Story.new
      story_two.add_actor('User')
      story_two.add_goal('do automated testing')
      story_two.add_reason('I can spend less time pressing keys')
      user_stories << story_two.synthesize

      markdown = ""
      markdown += "## Trello Rat User Stories"
      markdown += "\n"
      markdown += "\n"
      markdown += "- As a User, I want to do TDD so that I can have less errors in my code"
      markdown += "\n"
      markdown += "- As a User, I want to do automated testing so that I can spend less time pressing keys"

      generator.generate_markdown(*user_stories).must_equal markdown
    end
  end
end
