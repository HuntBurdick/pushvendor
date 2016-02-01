class MoneySource < ActiveRecord::Base
  has_many :payments
  has_many :expenses

  validates_uniqueness_of :name
end
