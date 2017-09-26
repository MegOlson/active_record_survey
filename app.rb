require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("lib/**/*.rb")
require("./lib/survey")
require("./lib/question")
require("./lib/choice")
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
  @survey = Survey.new({title: survey_title})
  if @survey.save()
    redirect "/surveys/".concat(@survey.id().to_s())
  else
    erb(:errors)
  end
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



get('/questions/:id') do

  @question = Question.find(params[:id])
  erb(:question)
end

post('/choice') do
  @question = Question.find(params['question_id'].to_i)
  choice_name = params['choice']

  @question.choices.create({choice: choice_name})
  @choices = @question.choices
  erb(:question)
end



delete('/questions/:id/delete') do
  @question = Question.find(params[:id])
  @question.delete
  redirect "/surveys/#{@question.survey_id}"
end

patch('/questions/:id/edit') do
  @question = Question.find(params[:id])
  @question.update({question: params["question"]})
  redirect"/questions/#{@question.id}"
end
