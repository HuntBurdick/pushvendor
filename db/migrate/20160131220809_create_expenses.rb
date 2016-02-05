class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :name
      t.text :description
      t.string :buyer
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :amount

      t.timestamps null: false
    end
  end
end
