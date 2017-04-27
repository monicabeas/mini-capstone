class Order < ApplicationRecord
	belongs_to :user
	has_many :products, through: :carted_products
	has_many :carted_products


	validates_numericality_of :subtotal, :greater_than_or_equal_to => 0
	validates_numericality_of :tax, :greater_than_or_equal_to => 0
	validates_numericality_of :total, :greater_than_or_equal_to => 0
	#validates :tax, presence: true, numericality: true, numericality: positive 
	#alidates :total, presence: true, numericality: true, numericality: positive
end
