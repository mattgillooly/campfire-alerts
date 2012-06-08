class SourceAndBlurbShouldBeOptional < ActiveRecord::Migration
  def up
    change_column :links, :source, :string, null: true
    change_column :links, :blurb, :text, null: true
  end

  def down
    change_column :links, :source, :string, null: false
    change_column :links, :blurb, :text, null: false
  end
end
