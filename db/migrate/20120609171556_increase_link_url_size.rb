class IncreaseLinkUrlSize < ActiveRecord::Migration
  def up
    change_column :links, :url, :string, null: false, limit:1000
  end

  def down
    change_column :links, :url, :string, null: false
  end
end
