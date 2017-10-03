class CreateCompetitions < ActiveRecord::Migration[5.1]
  def change
    create_table :competitions do |t|
      t.string :title
      t.date :date
      t.integer :sport_id

      t.timestamps
    end
  end
end
