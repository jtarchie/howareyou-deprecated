class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :registerable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :mindsets
  belongs_to :emotion_group

  after_initialize :set_emotion_group

  private

  def set_emotion_group
    self.emotion_group ||= EmotionGroup.first
    self.save
  end
end
