class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.text :content
      t.integer :section_id
      t.integer :user_id

      t.timestamps
    end
  end
end
