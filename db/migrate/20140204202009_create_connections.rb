class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.integer :shoe_id
      t.string :user_id

      t.timestamps
    end
  end
end
