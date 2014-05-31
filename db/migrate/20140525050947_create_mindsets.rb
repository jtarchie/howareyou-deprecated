class CreateMindsets < ActiveRecord::Migration
  def change
    create_table :mindsets do |t|
      t.belongs_to :user, index: true
      t.belongs_to :emotion, index: true

      t.timestamps
    end
  end
end
