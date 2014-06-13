class AddEmotionGroupToUser < ActiveRecord::Migration
  def change
    add_reference :users, :emotion_group, index: true
  end
end
