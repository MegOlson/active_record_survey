require 'spec_helper'

describe(Question) do
  it('validates presence of question input') do
    question = Question.new({:question => ""})
    expect(question.save()).to(eq(false))
  end
  it('ensures length of description is at most 50 characters') do
    question = Question.new({:question => "a".*(51)})
    expect(question.save()).to(eq(false))
  end
end
