class AddEmotionGroupToEmotions < ActiveRecord::Migration
  def change
    remove_index :emotions, :name
    add_reference :emotions, :emotion_group
    add_index :emotions, [:emotion_group_id, :name], unique: true
  end
end
