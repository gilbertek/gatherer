# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :text
      t.datetime :publish_date

      t.timestamps
    end

    add_index :posts, %i[id user_id], name: 'index_posts_on_post_id_user_id'
  end
end
