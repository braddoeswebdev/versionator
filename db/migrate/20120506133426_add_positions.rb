class AddPositions < ActiveRecord::Migration
  def down
	add_column :article, :position, :integer
	add_column :section, :position, :integer
  end
end
