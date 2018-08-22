class AddNumbersToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :user_number, :integer
    add_column :games, :cpu_number, :integer
  end
end
