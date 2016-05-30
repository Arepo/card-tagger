class CardTag < ActiveRecord::Base
  # fields:
  # card_id, tag_id


  belongs_to :card
  belongs_to :tag
end