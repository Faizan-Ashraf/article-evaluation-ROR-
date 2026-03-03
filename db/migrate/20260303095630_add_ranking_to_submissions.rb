class AddRankingToSubmissions < ActiveRecord::Migration[8.1]
  def change
    add_column :submissions, :ranking, :integer
  end
end
