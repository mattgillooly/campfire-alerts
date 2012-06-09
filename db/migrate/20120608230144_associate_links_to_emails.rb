class AssociateLinksToEmails < ActiveRecord::Migration
  def change
    add_column :links, :email_id, :integer

    add_index :links, :email_id
  end
end
