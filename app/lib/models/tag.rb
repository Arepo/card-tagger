class Tag < ActiveRecord::Base
  has_and_belongs_to_many :cards
  belongs_to :parent_tag, class_name: "Tag"
end