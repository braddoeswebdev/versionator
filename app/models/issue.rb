class Issue < ActiveRecord::Base
  attr_accessible :content, :status, :title

  has_many :tags
  has_many :users, :through => :tags
  has_many :comments
  belongs_to :submitter, :class_name => "User"
end
