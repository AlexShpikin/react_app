class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.integer :competition_id
      t.integer :sportsman_id
      t.integer :result

      t.timestamps
    end
  end
end
