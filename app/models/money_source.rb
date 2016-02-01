class MoneySource < ActiveRecord::Base
  has_many :payments
  has_many :expenses
end
