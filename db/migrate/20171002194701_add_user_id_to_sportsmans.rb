class AddUserIdToSportsmans < ActiveRecord::Migration[5.1]
  def change
    add_column :sportsmen, :user_id, :integer
  end
end
