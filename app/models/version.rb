class Version < ActiveRecord::Base
  attr_accessible :content, :section_id, :user_id

  belongs_to :section
  belongs_to :user
end
