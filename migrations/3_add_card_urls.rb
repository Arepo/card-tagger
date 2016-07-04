class AddCardUrls < ActiveRecord::Migration
  def up
    add_column :cards, :original_multiverse_id, :integer
    add_column :cards, :latest_multiverse_id, :integer
  end

  def down
    remove_column :cards, :original_multiverse_id
    remove_column :cards, :latest_multiverse_id
  end
end
