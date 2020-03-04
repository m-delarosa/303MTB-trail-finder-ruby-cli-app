class CreateUserTrailsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :user_trails do |t|
      t.references :user
      t.references :trail
    end
  end
end
