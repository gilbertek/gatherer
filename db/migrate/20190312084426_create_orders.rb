# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.boolean :refunded, default: false
      t.string :token
      t.string :phone_number

      t.timestamps
    end
  end
end
