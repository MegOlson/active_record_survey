require 'spec_helper'

describe(Question) do
  it('validates presence of question input') do
    question = Question.new({:question => ""})
    expect(question.save()).to(eq(false))
  end
end
