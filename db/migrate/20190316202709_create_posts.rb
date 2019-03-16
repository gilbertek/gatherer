# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :body
      t.datetime :publish_date

      t.timestamps
    end

    add_index :posts, %i[post_id user_id], unique: true
  end
end
