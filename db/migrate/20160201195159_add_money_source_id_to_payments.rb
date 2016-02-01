class AddMoneySourceIdToPayments < ActiveRecord::Migration
  def change
    add_reference :payments, :money_source, index: true, foreign_key: true
  end
end
