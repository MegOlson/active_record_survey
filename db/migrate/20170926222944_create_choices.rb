class CreateChoices < ActiveRecord::Migration[5.1]
  def change
    create_table(:choices) do |c|
      c.column(:choice, :string)

      c.timestamps()
    end
  end
end
