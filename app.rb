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
  @survey = Survey.find(params[:id])
  @questions = @survey.questions
  erb(:survey)
end

post('/question') do
  @survey = Survey.find(params['survey_id'].to_i)
  question_name = params['question']
  @survey.questions.create({question: question_name})
  @questions = @survey.questions
  erb(:survey)
end

delete('/surveys/:id/delete') do
  @survey = Survey.find(params[:id])
  @survey.delete
  redirect "/"
end

patch('/surveys/:id/edit') do
  @survey = Survey.find(params[:id])
  @survey.update({title: params["survey_name"]})
  redirect "/surveys/#{@survey.id}"
end
