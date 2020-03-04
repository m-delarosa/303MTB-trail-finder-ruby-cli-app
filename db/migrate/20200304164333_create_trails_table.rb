class CreateTrailsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :trails do |t|
      t.string :name
      t.string :location
      t.integer :length
      t.string :difficulty
      t.string :style
    end    
  end
end
