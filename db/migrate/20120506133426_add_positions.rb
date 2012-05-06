class AddPositions < ActiveRecord::Migration
  def change
	add_column :articles, :position, :integer
	add_column :sections, :position, :integer
  end
end
