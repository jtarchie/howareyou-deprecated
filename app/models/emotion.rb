class Emotion < ActiveRecord::Base
  has_many :mindsets
  belongs_to :emotion_group

  validates :emotion_group, presence: true
end
