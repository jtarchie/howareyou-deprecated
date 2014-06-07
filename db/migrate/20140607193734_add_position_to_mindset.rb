class AddPositionToMindset < ActiveRecord::Migration
  def change
    add_column :mindsets, :lat, :float
    add_column :mindsets, :lng, :float
  end
end
