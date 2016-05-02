class Tag < ActiveRecord::Base
  # db fields:
  # id, name, parent_tag_id

  has_many :card_tags, dependent: :destroy
  has_many :cards, through: :card_tags
  belongs_to :parent_tag, class_name: "Tag"

  def self.ids_and_full_names
    # TODO - Stop this hitting the database a hojillion times
    all.map do |tag|
      [tag.id, tag.full_name]
    end
  end

  def full_name
    parent_tag_id? ? "#{parent_tag.full_name}/#{name}" : name
  end
end
