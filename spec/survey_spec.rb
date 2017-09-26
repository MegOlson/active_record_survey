require('spec_helper')



describe(Survey) do
  describe("#questions") do
    it("tells which questions are in it") do
      test_survey = Survey.create({:title => "Some Title"})
      test_question1 = Question.create({:question => "question1", :survey_id => test_survey.id})
      test_question2 = Question.create({:question => "question2", :survey_id => test_survey.id})
     expect(test_survey.questions()).to(eq([test_question1, test_question2]))
    end
  end
end
