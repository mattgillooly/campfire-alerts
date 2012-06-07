class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :subject, null: false
      t.text :body, null: false
      t.string :from, null: false

      t.timestamps
    end
  end
end
