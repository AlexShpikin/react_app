class AddDescriptionColumnsToItems < ActiveRecord::Migration[5.1]
  def change
  	add_column :relationships, :place, :integer
  end
end
