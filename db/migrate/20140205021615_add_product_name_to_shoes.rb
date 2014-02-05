class AddProductNameToShoes < ActiveRecord::Migration
  def change
    add_column :shoes, :product_name, :string
  end
end
