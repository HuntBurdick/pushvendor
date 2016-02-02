class AddMadeByToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :made_by, :string
  end
end
