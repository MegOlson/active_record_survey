class Survey < ActiveRecord::Base
  has_many(:questions)
  before_save(:capitalize_first_letter)


private
  def capitalize_first_letter
    title = self.title.split(" ")
    self.title = title.map{|word| word.capitalize}.join(" ")
  end
end
