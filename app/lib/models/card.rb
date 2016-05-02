class Card < ActiveRecord::Base
  # fields:
  # id, name, mana_costs

  has_many :card_tags, dependent: :destroy
  has_many :tags, through: :card_tags
  validates :name, uniqueness: true, presence: true

  scope :with_tags, -> { includes(:tags) }
  scope :by_name, ->(name) { with_tags.where("lower(name) LIKE ?", "%#{name.downcase}%") }
  # scope :tagged_with, ->(tags)

  def self.tagged_with(tags)
    tags.any? ? joins(:card_tags).where(card_tags: { tag_id: tags }) : all
  end
end