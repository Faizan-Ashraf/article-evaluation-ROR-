class CreateSubmissions < ActiveRecord::Migration[7.0]
  def change
    create_table :submissions do |t|
      t.text :content
      t.references :competitor, null: false, foreign_key: { to_table: :users }
      t.references :competition, null: false, foreign_key: true
      t.text :feedback
      t.integer :score
      t.datetime :evaluated_at
      t.string :status, default: "Pending"

      t.timestamps
    end
  end
end