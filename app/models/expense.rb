class Expense < ActiveRecord::Base
  belongs_to :money_source
end
