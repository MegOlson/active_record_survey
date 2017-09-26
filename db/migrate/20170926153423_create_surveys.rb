class CreateSurveys < ActiveRecord::Migration[5.1]
  def change
    create_table(:surveys) do |s|
      s.column(:title, :string)
      s.timestamps()
    end
  end
end
