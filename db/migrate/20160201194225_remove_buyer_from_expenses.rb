class RemoveBuyerFromExpenses < ActiveRecord::Migration
  def change
    remove_column :expenses, :buyer, :string
  end
end
