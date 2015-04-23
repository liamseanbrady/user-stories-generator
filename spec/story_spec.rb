require_relative 'spec_helper'
require 'user_story'

describe 'Story' do
  let(:story) { Story.new }

  describe '#add_actor' do
    it 'adds an invalid input message to error messages for the actor when the input is empty string' do
      story.add_actor('')
      story.error_messages[:actor].wont_be_empty
    end

    it 'assigns the name of the actor to the actor ivar' do
      story.add_actor('User')
      story.actor.must_equal 'User'
    end
  end

  describe '#add_goal' do
    it 'adds an invalid input message to error messages when the input is empty string' do
      story.add_goal('')
      story.error_messages[:goal].wont_be_empty
    end

    it 'assigns the description of the goal to the goal ivar' do
      story.add_goal('do TDD')
      story.goal.must_equal('do TDD')
    end
  end

  describe '#add_reason' do
    it 'adds an invalid input message to error messages when the input is empty string' do
      story.add_reason('')
      story.error_messages[:reason].wont_be_empty
    end

    it 'assigns the reason for the user story to the reason ivar' do
      story.add_reason('I can limit the errors in my code')
      story.reason.must_equal('I can limit the errors in my code')
    end
  end

  describe '#valid?' do
    it 'returns true if there are no error messages for the user story' do
      story.add_actor('User')
      story.add_goal('do TDD')
      story.add_reason('I can limit the errors in my code')

      story.valid?.must_equal true
    end
    
    it 'returns false if there are error messages for the user story' do
      story.add_actor('')
      story.add_goal('do TDD')
      story.add_reason('I can limit the errors in my code')

      story.valid?.must_equal false
    end
  end

  describe '#build' do
    it 'raises an error if any of the user story sections are invalid' do
      story.add_actor('')
      story.add_goal('do TDD')
      story.add_reason('I can limit the errors in my code')
      
      ->{ story.build }.must_raise StandardError
    end

    it "returns the user story with correct indefinite article 'a' if the sections are valid" do
      story.add_actor('Person')
      story.add_goal('do TDD')
      story.add_reason('I can limit the errors in my code')
      
      story.build.must_equal 'As a Person, I want to do TDD so that I can limit the errors in my code'
    end
    
    it "returns the user story with correct indefinite article 'a' if the sections are valid and the actor is User" do
      story.add_actor('User')
      story.add_goal('do TDD')
      story.add_reason('I can limit the errors in my code')
      
      story.build.must_equal 'As a User, I want to do TDD so that I can limit the errors in my code'
    end

    it "returns the user story with correct indefinite article 'an' if the sections are valid" do
      story.add_actor('Administrator')
      story.add_goal('do TDD')
      story.add_reason('I can limit the errors in my code')
      
      story.build.must_equal 'As an Administrator, I want to do TDD so that I can limit the errors in my code'
    end
  end

  describe '#to_markdown' do
    it 'returns the story as markdown' do
      story.add_actor('Administrator')
      story.add_goal('do TDD')
      story.add_reason('I can limit the errors in my code')
      story.build
      
      story.to_markdown.must_equal '- As an Administrator, I want to do TDD so that I can limit the errors in my code'
    end
  end
end
