# frozen_string_literal: true

class Createposts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.integer :comments_counter
      t.integer :likes_counter
      t.timestamps # this will crate updated_at and created_at columns
      t.references :author, foreign_key: { to_table: 'users' } # this will create author_id and a corresponding index
    end
  end
end
