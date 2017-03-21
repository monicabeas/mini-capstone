class DeleteandAddSupplierId < ActiveRecord::Migration[5.0]
  def change
  	remove_column :suppliers, :supplier_id, :integer
  	remove_column :products, :string, :string 
  	add_column :products, :supplier_id, :integer
  end
end
