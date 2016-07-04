class Card < ActiveRecord::Base
  # fields:
  # id, name, mana_costs, original_multiverse_id, latest_multiverse_id

  has_many :card_tags, dependent: :destroy
  has_many :tags, through: :card_tags
  validates :name, uniqueness: true, presence: true

  scope :with_tags, -> { includes(:tags) }
  scope :by_name, ->(name) { with_tags.where("lower(name) LIKE ?", "%#{name.downcase}%") }

  def self.tagged_with(tags)
    tags.any? ? joins(:card_tags).where(card_tags: { tag_id: tags }) : all
  end

  def original_image_url
    gatherer_url(original_multiverse_id)
  end

  def latest_image_url
    gatherer_url(latest_multiverse_id)
  end

  def gatherer_url(multiverse_id)
    "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=#{multiverse_id}&type=card"
  end
end