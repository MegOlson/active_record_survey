class AddColumn < ActiveRecord::Migration[5.1]
  def change
    add_column(:choices, :question_id, :integer)
  end
end
