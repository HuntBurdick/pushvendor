class Item < ActiveRecord::Base
	has_many :line_items
	belongs_to :item_category

	validates :sku, :presence => true, :uniqueness => true
	validates :name, :presence => true, :uniqueness => true
	validates :price, :presence => true
	validates :stock_amount, :presence => true

	#default_scope { order('sku ASC') }
  default_scope { order(:sku => :asc) }
end
