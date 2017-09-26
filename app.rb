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

get('/surveys/:id') do
  @questions = Question.all
  @survey = Survey.find(params[:id])
  erb(:survey)
end

post('/question') do
  @survey = Survey.find(params['survey_id'])
  question_name = params['question']
  question = Question.new({question: question_name})
  question.save
  @questions = Question.all
  erb(:survey)
end
