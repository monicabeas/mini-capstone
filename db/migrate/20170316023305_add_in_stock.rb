class AddInStock < ActiveRecord::Migration[5.0]
  def change
	add_column :products, :stock_status, :boolean
  end
end
