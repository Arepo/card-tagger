class CreateCardsTags < ActiveRecord::Migration
  def change
    create_table :cards_tags, id: false do |t|
      t.belongs_to :card, index: true
      t.belongs_to :tag, index: true
    end
  end
end