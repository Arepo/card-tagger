class CreateCardTags < ActiveRecord::Migration
  def up
    create_table :card_tags do |t|
      t.belongs_to :card, index: true
      t.belongs_to :tag, index: true
    end
  end

  def down
    drop_table :card_tags
  end
end