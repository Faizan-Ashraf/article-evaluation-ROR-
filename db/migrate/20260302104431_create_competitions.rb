class CreateCompetitions < ActiveRecord::Migration[8.1]
  def change
    create_table :competitions do |t|
      t.string :title
      t.text :description
      t.text :evaluation_criteria
      t.references :created_by, null: false, foreign_key: { to_table: :users }
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
