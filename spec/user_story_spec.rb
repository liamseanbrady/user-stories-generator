require_relative 'spec_helper'
require 'user_story'

describe 'UserStory' do
  let(:user_story) { UserStory.new }

  describe '#add_actor' do
    it 'adds an invalid input message to error messages for the actor when the input is empty string' do
      user_story.add_actor('')
      user_story.error_messages[:actor].wont_be_empty
    end

    it 'assigns the name of the actor to the actor ivar' do
      user_story.add_actor('User')
      user_story.actor.must_equal 'User'
    end
  end

  describe '#add_goal' do
    it 'adds an invalid input message to error messages when the input is empty string' do
      user_story.add_goal('')
      user_story.error_messages[:goal].wont_be_empty
    end

    it 'assigns the description of the goal to the goal ivar' do
      user_story.add_goal('do TDD')
      user_story.goal.must_equal('do TDD')
    end
  end

  describe '#add_reason' do
    it 'adds an invalid input message to error messages when the input is empty string' do
      user_story.add_reason('')
      user_story.error_messages[:reason].wont_be_empty
    end

    it 'assigns the reason for the user story to the reason ivar' do
      user_story.add_reason('I can limit the errors in my code')
      user_story.reason.must_equal('I can limit the errors in my code')
    end
  end

  describe '#valid?' do
    it 'returns true if there are no error messages for the user story' do
      user_story.add_actor('User')
      user_story.add_goal('do TDD')
      user_story.add_reason('I can limit the errors in my code')

      user_story.valid?.must_equal true
    end
    
    it 'returns false if there are error messages for the user story' do
      user_story.add_actor('')
      user_story.add_goal('do TDD')
      user_story.add_reason('I can limit the errors in my code')

      user_story.valid?.must_equal false
    end
  end

  describe '#synthesize' do
    it 'raises an error if any of the user story sections are invalid' do
      user_story.add_actor('')
      user_story.add_goal('do TDD')
      user_story.add_reason('I can limit the errors in my code')
      
      ->{ user_story.synthesize }.must_raise StandardError
    end

    it "returns the user story with correct indefinite article 'a' if the sections are valid" do
      user_story.add_actor('Person')
      user_story.add_goal('do TDD')
      user_story.add_reason('I can limit the errors in my code')
      
      user_story.synthesize.must_equal 'As a Person, I want to do TDD so that I can limit the errors in my code'
    end
    
    it "returns the user story with correct indefinite article 'a' if the sections are valid and the actor is User" do
      user_story.add_actor('User')
      user_story.add_goal('do TDD')
      user_story.add_reason('I can limit the errors in my code')
      
      user_story.synthesize.must_equal 'As a User, I want to do TDD so that I can limit the errors in my code'
    end

    it "returns the user story with correct indefinite article 'an' if the sections are valid" do
      user_story.add_actor('Administrator')
      user_story.add_goal('do TDD')
      user_story.add_reason('I can limit the errors in my code')
      
      user_story.synthesize.must_equal 'As an Administrator, I want to do TDD so that I can limit the errors in my code'
    end
  end
end
