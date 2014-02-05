class AddBrandIdToShoes < ActiveRecord::Migration
  def change
    add_column :shoes, :brand_id, :integer
  end
end
