class ChangeDatatypeInExpenses < ActiveRecord::Migration
  def self.up
    change_column :expenses, :amount, :decimal, :precision => 8, :scale => 2
  end
  def self.down
    change_column :expenses, :amount, :integer
  end
end