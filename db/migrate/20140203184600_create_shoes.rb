class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.integer :product
      t.text :brandname
      t.text :imgurl
      t.text :producturl

      t.timestamps
    end
  end
end
