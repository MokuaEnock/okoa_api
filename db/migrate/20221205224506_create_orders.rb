class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.belongs_to :user, foreign_key: user_id
      t.string :name
      t.string :location
      t.integer :weight
      t.string :type
      t.string :instructions
      t.date :date

      t.timestamps
    end
  end
end
