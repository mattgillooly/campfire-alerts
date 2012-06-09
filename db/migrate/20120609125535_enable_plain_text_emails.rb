class EnablePlainTextEmails < ActiveRecord::Migration
  def change
    add_column :emails, :html, :boolean
  end
end
