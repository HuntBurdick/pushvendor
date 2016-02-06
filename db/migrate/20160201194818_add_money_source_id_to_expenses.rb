class AddMoneySourceIdToExpenses < ActiveRecord::Migration
  def change
    add_reference :expenses, :money_source, index: true, foreign_key: true
  end
end
