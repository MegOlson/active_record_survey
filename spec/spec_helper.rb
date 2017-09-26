ENV['RACK_ENV'] = 'test'

require("sinatra/activerecord")
require 'rspec'
require 'pg'
require 'survey'
require 'question'


RSpec.configure do |config|
  config.after(:each) do
    Survey.all().each() do |department|
      survey.destroy()
    end
    Question.all.each do |employee|
      question.destroy
    end
  end
end
