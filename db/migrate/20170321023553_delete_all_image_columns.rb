class DeleteAllImageColumns < ActiveRecord::Migration[5.0]
  def change
  	remove_column :images, :image_1, :string
  	remove_column :images, :image_2, :string
  	remove_column :images, :image_3, :string
  	remove_column :images, :image_4, :string

  	add_column :images, :image, :string 
  	add_column :images, :product_id, :integer
  end
end
