class AddRandomNumberToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :random_number, :integer
  end
end
