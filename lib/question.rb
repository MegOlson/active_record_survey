class Question < ActiveRecord::Base
  belongs_to(:survey)
  validates(:question, :presence => true)
  validates(:question, {:presence => true, :length => { :maximum => 50}})
end
