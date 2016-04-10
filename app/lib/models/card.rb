class Card < ActiveRecord::Base
  has_many :card_tags
  has_many :tags, through: :card_tags
  validates :name, uniqueness: true, presence: true

  scope :with_tags, -> { includes(:tags) }
  scope :by_name, ->(name) { with_tags.where("lower(name) LIKE ?", "%#{name.downcase}%") }
end