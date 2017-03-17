class UpdatePriceType < ActiveRecord::Migration[5.0]
  def change
  	change_column :products, :price, 'integer USING CAST(price AS integer)'
  end
end
