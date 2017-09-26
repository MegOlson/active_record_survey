class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table(:questions) do |q|
      q.column(:question, :string)

      q.timestamp()
    end
  end
end
