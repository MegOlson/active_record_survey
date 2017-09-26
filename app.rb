require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("lib/**/*.rb")
require("./lib/survey")
require("./lib/question")
require("pg")
require("pry")

get('/') do
  @surveys = Survey.all
  @questions = Question.all
  erb(:index)
end

post('/survey') do
  @surveys = Survey.all
  survey_title = params["survey_title"]
  survey = Survey.new({title: survey_title})
  survey.save
  erb(:index)
end
