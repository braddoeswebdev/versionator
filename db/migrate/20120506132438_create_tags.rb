class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags, :id => false do |t|
      t.integer :user_id
      t.integer :issue_id

      t.timestamps
    end
  end
end
