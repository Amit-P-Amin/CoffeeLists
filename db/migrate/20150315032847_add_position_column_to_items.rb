class AddPositionColumnToItems < ActiveRecord::Migration
  def change
    add_column :items, :position, :integer, null: false, index: true, default: 0
  end
end
