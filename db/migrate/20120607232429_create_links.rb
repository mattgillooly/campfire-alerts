class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url, null: false
      t.string :title, null: false
      t.string :source, null: false
      t.text :blurb, null: false

      t.timestamps
    end
  end
end
