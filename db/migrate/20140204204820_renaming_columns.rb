class RenamingColumns < ActiveRecord::Migration
  def change
  	change_table :shoes do |t|
  	t.rename :imgurl, :img_url
  	t.rename :producturl, :product_url
  	t.rename :brandname, :brand_name
	end
  end
end
