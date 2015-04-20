require_relative 'spec_helper'
require 'user_story'

describe 'UserStory' do
  describe '#add_actor' do
    it 'add an invalid input message to error messages when the input is empty string' do
      user_story = UserStory.new
      user_story.add_actor('')
      user_story.error_messages.wont_be_empty
    end

    it 'adds the name of the actor to the current user story if input is valid' do
      user_story = UserStory.new
      user_story.add_actor('User')
      user_story.actor.must_equal 'User'
    end
  end
end
