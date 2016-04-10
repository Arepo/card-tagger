class CreateCards < ActiveRecord::Migration
  def up
    create_table :cards do |t|
      t.string :name
      t.text :mana_costs
    end
  end

  def down
    drop_table :cards
  end
end