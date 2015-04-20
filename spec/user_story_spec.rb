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
end
