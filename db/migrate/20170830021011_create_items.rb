class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.references :user, index: true, foreign_key: true
      t.string :create_by
      t.references :list, index: true, foreign_key: true
      t.integer :priority
      t.integer :duration
      t.string :repeat
      t.datetime :due
      t.datetime :active
      t.datetime :start

      t.timestamps null: false
    end
  end
end
