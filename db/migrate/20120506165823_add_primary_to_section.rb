class AddPrimaryToSection < ActiveRecord::Migration
  def change
    add_column :sections, :primary_id, :integer
  end
end
