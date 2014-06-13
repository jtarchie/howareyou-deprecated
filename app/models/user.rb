class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :registerable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable,
         :validatable, :invitable

  has_many :mindsets
  belongs_to :emotion_group

  before_create :set_emotion_group

  private

  def set_emotion_group
    self.emotion_group ||= EmotionGroup.first
  end
end
