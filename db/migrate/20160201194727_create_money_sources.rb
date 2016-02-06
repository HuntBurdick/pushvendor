class CreateMoneySources < ActiveRecord::Migration
  def change
    create_table :money_sources do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
