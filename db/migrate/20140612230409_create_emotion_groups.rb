class CreateEmotionGroups < ActiveRecord::Migration
  def change
    create_table :emotion_groups do |t|
      t.string :name
      t.string :source
      t.timestamps
    end

    add_index :emotion_groups, :name, unique: true
  end
end
