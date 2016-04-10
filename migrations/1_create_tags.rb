class CreateTags < ActiveRecord::Migration
  def up
    create_table :tags do |t|
      t.string :name
      t.references :parent_tag, index: true
    end
  end

  def down
    drop_table :tags
  end
end