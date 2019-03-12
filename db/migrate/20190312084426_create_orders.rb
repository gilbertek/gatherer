class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.boolean :refunded
      t.string :token
      t.string :phone_number

      t.timestamps
    end
  end
end
