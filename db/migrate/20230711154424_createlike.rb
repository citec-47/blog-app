# frozen_string_literal: true

class Createlike < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :author, foreign_key: { to_table: 'users' }
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
